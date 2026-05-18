//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coveringView: UIView?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        // Set a FUIInfoViewController as the rootViewController, since there it is none set in the Main.storyboard
        // Also, hide potentially sensitive data of the real application screen during onboarding
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        window!.rootViewController = FUIInfoViewController.createSplashScreenInstanceFromStoryboard()

        AppDelegate.shared.initializeOnboarding(scene: scene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        SceneDelegateDispatcher.sceneDidDisconnect(scene)
    }

    func sceneDidBecomeActive(_: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        showAppScreen()
    }

    func sceneWillResignActive(_: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        hideAppScreen()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        SceneDelegateDispatcher.sceneWillEnterForeground(scene)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        SceneDelegateDispatcher.sceneDidEnterBackground(scene)
    }
}

extension SceneDelegate {
    func hideAppScreen() {
        guard coveringView == nil else {
            return
        }
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LaunchScreen")
        coveringView = vc.view
        coveringView!.frame = window!.bounds
        coveringView!.alpha = 0
        window!.addSubview(coveringView!)
        window!.bringSubviewToFront(coveringView!)

        UIView.animate(withDuration: 0.3) {
            self.coveringView?.alpha = 1.0
        }
    }

    func showAppScreen() {
        UIView.animate(withDuration: 0.3) {
            self.coveringView?.alpha = 0
        } completion: { _ in
            self.coveringView?.removeFromSuperview()
            self.coveringView = nil
        }
    }
}

extension UIScene {
    var window: UIWindow? {
        (delegate as? UIWindowSceneDelegate)?.window ?? nil
    }
}
