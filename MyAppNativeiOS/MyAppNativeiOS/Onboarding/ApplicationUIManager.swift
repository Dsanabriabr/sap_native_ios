//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation

class ApplicationUIManager: ApplicationUIManaging {
    // MARK: – Properties

    // storing `FUIInfoViewController` corresponds to `persistentIdentifier` of UISceneSession
    private var progressScreens: [String: FUIInfoViewController] = [:]
    private var shouldRemoveCoveringViews = [String: Bool]()

    init() {}

    // MARK: - ApplicationUIManaging

    func showSplashScreenForOnboarding(completionHandler: @escaping (Error?) -> Void) {
        if let onboardingSceneSessionID = SceneManager.shared.getOnboardingSceneSessionID() {
            // check if screen is already covered/hidden otherwise setup the splash screen
            if progressScreens[onboardingSceneSessionID] == nil {
                setupSplashScreen(scene: onboardingSceneSessionID)
            } else {
                showMessageOnScreen(scene: onboardingSceneSessionID, message: "")
            }
        }

        completionHandler(nil)
    }

    func showSplashScreenForUnlock(completionHandler: @escaping (Error?) -> Void) {
        if let onboardingSceneSessionID = SceneManager.shared.getOnboardingSceneSessionID() {
            // check if screen is already covered/hidden otherwise setup the splash screen
            if progressScreens[onboardingSceneSessionID] == nil {
                setupSplashScreen(scene: onboardingSceneSessionID)
            } else {
                showMessageOnScreen(scene: onboardingSceneSessionID, message: "")
            }
        }

        completionHandler(nil)
    }

    func showProgressScreenForOnboarding(scene sessionID: String, completionHandler: @escaping (Error?) -> Void) {
        coverView(scene: sessionID, message: LocalizedStrings.Onboarding.switchWindowWhileOnboardingMessage)
        completionHandler(nil)
    }

    func hideApplicationScreen(scene sessionID: String?, completionHandler: @escaping (Error?) -> Void) {
        if sessionID == nil, let sceneSessionID = UIApplication.shared.connectedScenes.first?.session.persistentIdentifier {
            coverView(scene: sceneSessionID, message: "")
        } else if sessionID == SceneManager.shared.getOnboardingSceneSessionID() {
            coverView(scene: sessionID!, message: "")
        } else {
            coverView(scene: sessionID!, message: LocalizedStrings.Onboarding.switchWindowToUnlockMessage)
        }
        completionHandler(nil)
    }

    func showApplicationScreen(scene sessionID: String?, completionHandler: @escaping (Error?) -> Void) {
        if let sceneSessionID = sessionID {
            hideCover(scene: sceneSessionID)
            showApplicationScreen(scene: sceneSessionID)
        } else if let sceneSessionID = UIApplication.shared.connectedScenes.first?.session.persistentIdentifier {
            hideCover(scene: sceneSessionID)
            showApplicationScreen(scene: sceneSessionID)
        } else {
            // this case will never run
            fatalError()
        }
        completionHandler(nil)
    }

    func releaseRootFromMemory() {
        let modalPresenter = OnboardingFlowProvider.modalUIViewControllerPresenter
        modalPresenter.clearSplashScreen()
        modalPresenter.resetPreserveData()
        if let onboardingSceneSessionID = SceneManager.shared.getOnboardingSceneSessionID() {
            hideCover(scene: onboardingSceneSessionID)
            setupSplashScreen(scene: onboardingSceneSessionID)
        }
    }

    // MARK: – Helpers

    private func setupSplashScreen(scene sessionID: String) {
        var splashViewController = FUIInfoViewController.createSplashScreenInstanceFromStoryboard()

        coverView(scene: sessionID, message: "")
        splashViewController = progressScreens[sessionID] ?? splashViewController

        // Set the splash screen for the specific presenter
        let modalPresenter = OnboardingFlowProvider.modalUIViewControllerPresenter
        if let rootVc = SceneManager.shared.getCurrentOnboardingWindow()?.rootViewController as? FUIInfoViewController {
            modalPresenter.setSplashScreen(rootVc)
        } else {
            // should never happen but adding as a fail safe
            modalPresenter.setSplashScreen(splashViewController)
        }
        modalPresenter.animated = true
    }
}

public extension UIApplication {
    var isSplitOrSlideOver: Bool {
        guard let window = connectedScenes.filter({ $0.activationState == .foregroundActive }).first?.window else { return false }
        return !(window.frame.width == window.screen.bounds.width)
    }
}

extension ApplicationUIManager {
    func createProgressScreen() -> FUIInfoViewController {
        let splashViewController = FUIInfoViewController.createInstanceFromStoryboard()
        splashViewController.primaryButton.isHidden = true
        splashViewController.secondaryButton.isHidden = true
        splashViewController.titleTextView.text = ""
        return splashViewController
    }

    func setProgressScreen(scene sessionID: String) {
        if progressScreens[sessionID] == nil {
            let screen = createProgressScreen()
            progressScreens[sessionID] = screen
        }
    }

    func showApplicationScreen(scene sessionID: String) {
        guard let scene = SceneManager.getScene(sessionID: sessionID) else {
            return
        }

        if !(scene.window?.rootViewController is FUIInfoViewController), shouldRemoveCoveringViews[sessionID] ?? false {
            SAPFioriBannerHandler.shared.hideTopBanner()
            hideCover(scene: sessionID)
            return
        }

        guard let window = scene.window else {
            return
        }
        let appViewController: UIViewController
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let splitViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainSplitViewController") as! UISplitViewController
        splitViewController.delegate = appDelegate
        splitViewController.modalPresentationStyle = .currentContext
        splitViewController.preferredDisplayMode = .oneBesideSecondary
        appViewController = splitViewController

        if UIDevice.current.userInterfaceIdiom == .pad, !UIApplication.shared.isSplitOrSlideOver {
            let viewController = UIViewController()
            viewController.view.backgroundColor = UIColor.preferredFioriColor(forStyle: .primaryBackground)
            let navigationViewController = splitViewController.viewControllers.last as! UINavigationController
            navigationViewController.viewControllers = [viewController]
        }
        shouldRemoveCoveringViews[sessionID] = true
        SAPFioriBannerHandler.shared.hideTopBanner()
        window.rootViewController = appViewController
    }

    func coverView(scene sessionID: String, message: String) {
        guard let scene = SceneManager.getScene(sessionID: sessionID) else {
            return
        }
        if progressScreens[sessionID] != nil { // screen already covered
            return
        }
        setProgressScreen(scene: sessionID)
        let progressScreen = progressScreens[sessionID]
        progressScreen?.informationTextView.text = message

        let window = scene.window!
        let superView = scene.window!.rootViewController!.view
        let subView = progressScreen!.view
        window.addSubview(subView!)

        subView?.translatesAutoresizingMaskIntoConstraints = true
        subView?.center = CGPoint(x: superView!.bounds.midX, y: superView!.bounds.midY)
        subView?.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
    }

    func hideCover(scene sessionID: String) {
        let coveringView = progressScreens[sessionID]?.view
        coveringView?.removeFromSuperview()
        progressScreens.removeValue(forKey: sessionID)
    }

    func showMessageOnScreen(scene sessionID: String, message: String) {
        let progressScreen = progressScreens[sessionID]
        progressScreen?.informationTextView.text = message
    }
}
