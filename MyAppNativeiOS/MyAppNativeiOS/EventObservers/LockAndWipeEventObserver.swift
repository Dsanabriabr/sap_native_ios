//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import SAPCommon
import SAPFioriFlows
import SAPFoundation

public class LockAndWipeEventObserver: LockAndWipeEventObserving {
    private let logger = Logger.shared(named: "AppLockAndWipeEventObserver")

    public static let shared: LockAndWipeEventObserver = .init()

    public init() {
        // Empty Intializer
    }

    public func register() {
        // Registering the Observer to LockAndWipeManager
        LockAndWipeManager.shared.register(self)
    }

    public func willLock() async {
        logger.debug("Called: willLock")
    }

    public func didLock() async {
        logger.debug("Called: didLock")
    }

    public func didWipe() async {
        logger.debug("Called: didWipe")
        resetOnboardingSessionManager()
    }

    public func willWipe() async {
        logger.debug("Called: willWipe")
    }

    private func resetOnboardingSessionManager() {
        DispatchQueue.main.sync {
            let sessionManagerState = OnboardingSessionManager.shared.state
            switch sessionManagerState {
            // Ensure `removeSession` is not called during onboard/restore flow
            case .initial, .inFlow, .inBackgroundProcessing:
                return

            case .opened, .locked:
                AlertHelper.displayAlert(
                    with: LocalizedStrings.Onboarding.wipeTitle,
                    message: LocalizedStrings.Onboarding.trafficWipedMessage,
                    viewController: OnboardingErrorHandler.getTopViewController()
                ) {
                    OnboardingErrorHandler.resetOnboardingSessionManager()
                }

            default:
                self.logger.debug("default Case")
            }
        }
    }
}
