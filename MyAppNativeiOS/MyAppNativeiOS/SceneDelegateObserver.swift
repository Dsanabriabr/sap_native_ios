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

public class SceneDelegateObserver: SceneDelegateObserving {
    init(sceneSessionID: String) {
        self.sceneSessionID = sceneSessionID
    }

    var scene: UIScene? {
        UIApplication.shared.connectedScenes.first(where: { $0.session.persistentIdentifier == sceneSessionID })
    }

    var sceneSessionID: String
    let progressMessage = LocalizedStrings.Onboarding.switchWindowWhileOnboardingMessage

    public func onboardingDidFail(withError: Error) {
        AppDelegate.shared.presentationDelegate.showMessageOnScreen(scene: sceneSessionID, message: withError.localizedDescription)
    }

    public func onboardingSceneDidChange(_ scene: UIScene, newOnboardingScene sessionID: String) {
        if scene.session.persistentIdentifier == sessionID {
            // clear saved UI related data of last UIScene associated with Onboarding
            AppDelegate.shared.presentationDelegate.releaseRootFromMemory()
            // Re-Intilize the onboarding in the currest UIScene
            AppDelegate.shared.onboardUser(scene: scene)
        }
    }

    public func sceneWillEnterForeground(_: UIScene) {
        switch UIApplication.sharedOrNil?.applicationState {
        case .background:
            if sceneSessionID == SceneManager.shared.getOnboardingSceneSessionID() {
                AppDelegate.shared.unlock()
            }
        default:
            break
        }
    }

    public func sceneDidEnterBackground(_: UIScene) {
        switch UIApplication.sharedOrNil?.applicationState {
        case .background:
            if sceneSessionID == SceneManager.shared.getOnboardingSceneSessionID() {
                AppDelegate.shared.lock()
            }

        default:
            break
        }
    }
}
