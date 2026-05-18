//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SharedFmwk

/// custom data handling of the application
open class ApplicationOnboardingSession: OnboardingSession {
    var odataControllers: [String: ODataControlling]

    public required init(flow: OnboardingFlow) {
        guard let step = flow.steps.first(where: { $0 is ODataOnboardingStep }) as? ODataOnboardingStep else {
            fatalError("ODataOnboardingStep is missing.")
        }
        guard !step.controllers.isEmpty else {
            fatalError("Controllers are missing for ODataOnboardingStep.")
        }
        odataControllers = step.controllers

        super.init(flow: flow)
    }
}

public class OnboardingErrorHandler: OnboardingControllerDelegate {
    // MARK: - OnboardingControllerDelegate

    /// Application specific error handling
    public func onboardingController(_ controller: OnboardingControlling, didFail flow: OnboardingFlow, with error: Error, completionHandler: @escaping (OnboardingErrorDisposition) -> Void) {
        // notify observers that onboarding has failed
        var sceneDelegateObserverMap = SceneDelegateDispatcher.getObservers()
        if let sceneSessionID = SceneManager.shared.getOnboardingSceneSessionID() {
            sceneDelegateObserverMap.removeValue(forKey: sceneSessionID) // removing observer corresponding to onboarding scene session
        }
        sceneDelegateObserverMap.compactMap { $0.value as? SceneDelegateObserver }.forEach { $0.onboardingDidFail(withError: error) }

        switch flow.flowType {
        case .onboard:
            onboardFailed(with: error, completionHandler: completionHandler)

        case .restore:
            restoreFailed(with: error, controller: controller, onboardingID: flow.context.onboardingID, completionHandler: completionHandler)

        default:
            completionHandler(.retry)
        }
    }

    /// Onboarding error handling can be customized here
    public func handleOnboardingError(_ error: Error) {
        switch error {
        case WelcomeScreenError.demoModeRequested:
            AppDelegate.shared.startDemoMode()
        default:
            // An error here means a critical error – the `OnboardingErrorHandler` responded with OnboardingDisposition.stop to stop the onboarding.
            let onboardingScene = SceneManager.shared.getCurrentOnboardingScene() ?? UIApplication.shared.connectedScenes.first!
            DispatchQueue.main.async {
                AppDelegate.shared.onboardUser(scene: onboardingScene)
            }
        }
    }

    /// Unlocking error handling can be customized here
    public func handleUnlockingError(_ error: Error) {
        switch error {
        // We reset the OnboardingSessionManager if the user has chosen to reset their passcode
        case OnboardingError.cancelled(_), StoreManagerError.resetPasscode:
            OnboardingErrorHandler.resetOnboardingSessionManager()
        // We reset the OnboardingSessionManager if the user has exceeded the maximum retry limit
        case StoreManagerError.passcodeRetryLimitReached:
            let alertController = UIAlertController(title: LocalizedStrings.Onboarding.passcodeRetryLimitReachedTitle, message: LocalizedStrings.Onboarding.passcodeRetryLimitReachedMessage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.resetTitle, style: .destructive) { _ in
                OnboardingErrorHandler.resetOnboardingSessionManager()
            })

            DispatchQueue.main.async {
                guard let topViewController = ModalUIViewControllerPresenter.topPresentedViewController() else {
                    fatalError("Invalid UI state")
                }
                topViewController.present(alertController, animated: true)
            }
        default:
            return
        }
    }

    // MARK: - Private

    /// Onboarding related error handling
    private func onboardFailed(with error: Error, completionHandler: @escaping (OnboardingErrorDisposition) -> Void) {
        switch error {
        case WelcomeScreenError.demoModeRequested:
            completionHandler(.stop(error))
            return
        case ApplicationVersioningError.inactive:
            showAlertWith(error: error)
        default:
            showAlertWith(error: error)
        }

        func showAlertWith(error: Error) {
            let alertController = UIAlertController(
                title: LocalizedStrings.Onboarding.failedToLogonTitle,
                message: error.localizedDescription,
                preferredStyle: .alert
            )

            alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.retryTitle, style: .default) { _ in
                completionHandler(.retry)
            })

            DispatchQueue.main.async {
                guard let topViewController = ModalUIViewControllerPresenter.topPresentedViewController() else {
                    fatalError("Invalid UI state")
                }
                topViewController.present(alertController, animated: true)
            }
        }
    }

    /// Restoring related error handling
    private func restoreFailed(with error: Error, controller: OnboardingControlling, onboardingID: UUID?, completionHandler: @escaping (OnboardingErrorDisposition) -> Void) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            var presentCustomAlert: (() -> Void)?

            switch error {
            case StoreManagerError.cancelPasscodeEntry, StoreManagerError.skipPasscodeSetup, StoreManagerError.resetPasscode:
                self.resetOnboarding(onboardingID, controller: controller, completionHandler: completionHandler)
                return
            case StoreManagerError.passcodeRetryLimitReached:
                alertController.title = LocalizedStrings.Onboarding.passcodeRetryLimitReachedTitle
                alertController.message = LocalizedStrings.Onboarding.passcodeRetryLimitReachedMessage
            case LockWipePolicyError.trafficLocked:
                presentCustomAlert = {
                    AlertHelper.displayAlert(
                        with: LocalizedStrings.Onboarding.lockTitle,
                        message: LocalizedStrings.Onboarding.trafficLockedMessage,
                        viewController: OnboardingErrorHandler.getTopViewController()
                    ) {
                        completionHandler(.retry)
                    }
                }
            case LockWipePolicyError.trafficWiped:
                presentCustomAlert = {
                    AlertHelper.displayAlert(
                        with: LocalizedStrings.Onboarding.wipeTitle,
                        message: LocalizedStrings.Onboarding.trafficWipedMessage,
                        viewController: OnboardingErrorHandler.getTopViewController()
                    ) {
                        self.resetOnboarding(onboardingID, controller: controller, completionHandler: completionHandler)
                    }
                }
            case SAPcpmsLockWipePolicyError.wipeDisconnectedPeriod:
                presentCustomAlert = {
                    AlertHelper.displayAlert(
                        with: LocalizedStrings.Onboarding.wipeTitle,
                        message: LocalizedStrings.Onboarding.wipeMessage,
                        viewController: OnboardingErrorHandler.getTopViewController()
                    ) {
                        completionHandler(.stop(SAPcpmsLockWipePolicyError.wipeDisconnectedPeriod))
                    }
                }
            case SAPcpmsLockWipePolicyError.lockDisconnectedPeriod:
                presentCustomAlert = {
                    AlertHelper.displayAlert(
                        with: LocalizedStrings.Onboarding.lockTitle,
                        message: LocalizedStrings.Onboarding.lockMessage,
                        viewController: OnboardingErrorHandler.getTopViewController()
                    ) {
                        completionHandler(.stop(SAPcpmsLockWipePolicyError.lockDisconnectedPeriod))
                    }
                }
            case ApplicationVersioningError.inactive:
                alertController.title = LocalizedStrings.Onboarding.failedToLogonTitle
                alertController.message = error.localizedDescription
                alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.retryTitle, style: .default) { _ in
                    completionHandler(.retry)
                })
            default:
                alertController.title = LocalizedStrings.Onboarding.failedToLogonTitle
                alertController.message = error.localizedDescription
                alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.retryTitle, style: .default) { _ in
                    completionHandler(.retry)
                })
            }

            // Add reset action if not using a custom alert
            if presentCustomAlert == nil {
                alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.resetTitle, style: .destructive) { _ in
                    self.resetOnboarding(onboardingID, controller: controller, completionHandler: completionHandler)
                })
            }

            if presentCustomAlert == nil {
                let topViewController = OnboardingErrorHandler.getTopViewController()
                topViewController.present(alertController, animated: true)
            } else {
                presentCustomAlert?()
            }
        }
    }

    /// Reset onboarding, then start a new onboarding flow
    private func resetOnboarding(_ onboardingID: UUID?, controller: OnboardingControlling, completionHandler: @escaping (OnboardingErrorDisposition) -> Void) {
        guard let onboardingID = onboardingID else {
            completionHandler(.retry)
            return
        }

        (controller as? OnboardingController)?.resetFlow(for: onboardingID) { _ in
            completionHandler(.retry)
        }
    }

    /// Private function that resets the OnboardingSessionManager
    static func resetOnboardingSessionManager() {
        OnboardingSessionManager.shared.removeSession { _ in
            DispatchQueue.main.async {
                let applicationUIManager = OnboardingSessionManager.shared.presentationDelegate as? ApplicationUIManager
                applicationUIManager?.releaseRootFromMemory()

                OnboardingSessionManager.shared.open { _ in }
            }
        }
    }

    /// Method to get TopViewController
    static func getTopViewController() -> UIViewController {
        guard let topViewController = ModalUIViewControllerPresenter.topPresentedViewController() else {
            fatalError("Invalid UI state")
        }
        return topViewController
    }
}
