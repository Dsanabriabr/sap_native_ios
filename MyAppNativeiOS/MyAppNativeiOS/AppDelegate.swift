//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, ConnectivityObserver, UNUserNotificationCenterDelegate {
    lazy var presentationDelegate: ApplicationUIManager = .init()

    var flowProvider = OnboardingFlowProvider()

    /// Delegate implementation of the application in a custom class
    var onboardingErrorHandler: OnboardingErrorHandler?

    /// Application controller instance for the application
    var sessionManager: OnboardingSessionManager<ApplicationOnboardingSession>!

    /// Logger instance initialization
    private let logger = Logger.shared(named: "AppDelegateLogger")

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeLogUploader()
        initializeUsageCollection()

        // Read more about Logging: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/879aaebaa8e6401dac100ea9bb8b817d.html
        Logger.root.logLevel = .debug

        // Customize the UI to align SAP style
        // Read more: https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFiori/Extensions/UINavigationBar.html
        UIFont.registerFioriFonts()
        UINavigationBar.applyFioriStyle()
        UINavigationBar.appearance().isTranslucent = true

        ConnectivityReceiver.registerObserver(self)

        return true
    }

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: "default", sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }

    // MARK: - UISplitViewControllerDelegate

    func splitViewController(_: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto _: UIViewController) -> Bool {
        guard let detailVC = secondaryViewController as? UINavigationController else {
            return false // Use default behavior if secondary is not a UINavigationController.
        }
        return detailVC.viewControllers.isEmpty
    }

    func application(_: UIApplication, supportedInterfaceOrientationsFor _: UIWindow?) -> UIInterfaceOrientationMask {
        // Onboarding is only supported in portrait orientation
        switch OnboardingFlowController.presentationState {
        case .onboarding, .restoring:
            return .portrait
        default:
            return .allButUpsideDown
        }
    }
}

/// Convenience accessor for the AppDelegate
extension AppDelegate {
    static var shared: AppDelegate {
        return (UIApplication.shared.delegate as! AppDelegate)
    }
}

/// Registers to LockAndWipeManger
extension AppDelegate {
    func registerLockAndWipeObserver() {
        LockAndWipeEventObserver.shared.register()
    }
}

// MARK: – Onboarding related functionality

// MARK: OnboardingSessionManager helper extension

extension OnboardingSessionManager {
    static var shared: OnboardingSessionManager<ApplicationOnboardingSession>! {
        return AppDelegate.shared.sessionManager
    }
}

extension AppDelegate {
    /// Setup an onboarding session instance
    func initializeOnboarding(scene: UIScene) {
        if sessionManager == nil {
            onboardingErrorHandler = OnboardingErrorHandler()
            sessionManager = OnboardingSessionManager(presentationDelegate: presentationDelegate, flowProvider: flowProvider, delegate: onboardingErrorHandler)
        }

        onboardUser(scene: scene)
    }

    /// Start demo mode
    func startDemoMode() {
        let alertController = UIAlertController(
            title: LocalizedStrings.AppDelegate.startDemoModeTitle,
            message: LocalizedStrings.AppDelegate.startDemoModeMessage,
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(title: LocalizedStrings.AppDelegate.startDemoModeRestartTitle, style: .default) { _ in
                self.onboardUser(scene: SceneManager.shared.getCurrentOnboardingScene())
            }
        )

        DispatchQueue.main.async {
            guard let topViewController = ModalUIViewControllerPresenter.topPresentedViewController() else {
                fatalError("Invalid UI state")
            }
            topViewController.present(alertController, animated: true)
        }
    }

    /// Application specific code after successful onboard
    func afterOnboard() {
        guard let _ = sessionManager.onboardingSession else {
            logger.debug("Onboarding Session Not Found")
            return
        }

        registerLockAndWipeObserver()
        initializeRemoteNotification()
        uploadLogs()
        uploadUsageReport()
        uploadCrashReport()
    }

    /// Start onboarding a user
    func onboardUser(scene: UIScene?) {
        if let scene = scene {
            let observer = SceneDelegateObserver(sceneSessionID: scene.session.persistentIdentifier)
            SceneDelegateDispatcher.register(scene: scene.session.persistentIdentifier, observer)
            SceneManager.shared.setCurrentSceneSessionID(id: scene.session.persistentIdentifier)
        }
        sessionManager.open { error in
            if let error = error {
                self.onboardingErrorHandler?.handleOnboardingError(error)
                return
            }
            self.afterOnboard()
        }
    }

    func lock() {
        sessionManager.lock { _ in
        }
    }

    func unlock() {
        sessionManager.unlock { error in
            guard let error = error else {
                return
            }
            self.onboardingErrorHandler?.handleUnlockingError(error)
        }
    }
}

// MARK: - ConnectivityObserver implementation

extension AppDelegate {
    func connectionEstablished() {
        // connection established
        logger.info("Connection established.")
    }

    func connectionChanged(_ previousReachabilityType: ReachabilityType, reachabilityType _: ReachabilityType) {
        // connection changed
        logger.info("Connection changed.")
        if case previousReachabilityType = ReachabilityType.offline {
            // connection established
            flowProvider.runSynchingFlow = true
            OnboardingSessionManager.shared.open { error in
                if let error = error {
                    self.logger.error("Error in opeing session", error: error)
                }
            }
        }
    }

    func connectionLost() {
        // connection lost
        logger.info("Connection lost.")
    }
}

// MARK: - Remote notification handling

extension AppDelegate {
    // Read more about Remote Notifications on mobile services: https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFoundation/Remote%20Notifications.html

    func initializeRemoteNotification() {
        // Registering for remote notifications
        UIApplication.shared.registerForRemoteNotifications()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            // Enable or disable features based on authorization.
        }
        center.delegate = self
    }

    func uploadDeviceTokenForRemoteNotification(_ deviceToken: Data) {
        guard let session = sessionManager.onboardingSession else {
            // Onboarding not yet performed
            return
        }
        let parameters = SAPcpmsRemoteNotificationParameters(deviceType: "iOS")
        session.registerDeviceToken(deviceToken: deviceToken, withParameters: parameters) { error in
            if let error = error {
                self.logger.error("Register DeviceToken failed", error: error)
                return
            }
            self.logger.info("Register DeviceToken succeeded")
        }
    }

    // MARK: AppDelegate method implementations for remote notification handling

    func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        uploadDeviceTokenForRemoteNotification(deviceToken)
    }

    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        logger.error("Failed to register for Remote Notification", error: error)
    }

    /// Called to let your app know which action was selected by the user for a given notification.
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        logger.info("App opened via user selecting notification: \(response.notification.request.content.body)")
        // Here is where you want to take action to handle the notification, maybe navigate the user to a given screen.
        completionHandler()
    }

    /// Called when a notification is delivered to a foreground app.
    func userNotificationCenter(_: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        logger.info("Remote Notification arrived while app was in foreground: \(notification.request.content.body)")
        // Currently we are presenting the notification alert as the application were in the background.
        // If you have handled the notification and do not want to display an alert, call the completionHandler with empty options: completionHandler([])
        completionHandler([.banner, .sound])
    }
}

// MARK: - Log upload initialization and handling

/// Read more about Log upload: https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFoundation/Log%20Upload.html
extension AppDelegate {
    private func initializeLogUploader() {
        do {
            // Attaches a LogUploadFileHandler instance to the root of the logging system
            try SAPcpmsLogUploader.attachToRootLogger()
        } catch {
            logger.error("Failed to attach to root logger.", error: error)
        }
    }

    private func uploadLogs() {
        guard let session = sessionManager.onboardingSession else {
            // Onboarding not yet performed
            return
        }
        // Upload logs after onboarding
        SAPcpmsLogUploader.uploadLogs(session) { error in
            if let error = error {
                self.logger.error("Error happened during log upload.", error: error)
                return
            }
            self.logger.info("Logs have been uploaded successfully.")
        }
    }
}

// MARK: - Usage collection initialization and upload

extension AppDelegate {
    private func initializeUsageCollection() {
        do {
            // Required call to configure OSlifecycle notification, specify data collection items during event triggers, and configure usage store behavior.
            try UsageBroker.shared.start()
        } catch {
            logger.error("Failed to initialize usage collection.", error: error)
        }
    }

    private func uploadUsageReport() {
        guard sessionManager.onboardingSession != nil else {
            // Onboarding not yet performed
            return
        }
        // Upload usage report after onboarding
        UsageBroker.shared.upload()
    }
}

// MARK: - Crash report upload

extension AppDelegate {
    private func uploadCrashReport() {
        guard let session = sessionManager.onboardingSession else {
            // Onboarding not yet performed
            return
        }
        guard let settingsParameters = session.settingsParameters else {
            return
        }
        // Upload crash logs after onboarding
        SAPCrashReporter.shared.uploadCrashFile(sapURLSession: session.sapURLSession, settingsParameters: settingsParameters)
    }
}
