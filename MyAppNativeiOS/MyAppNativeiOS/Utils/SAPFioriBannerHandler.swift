
//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import Foundation
import SAPCommon
import SAPFiori

class SAPFioriBannerHandler {
    static let shared = SAPFioriBannerHandler()
    var messageBanners: [String: FUIBannerMessageView] = [:] // messageview corresponds to scene session id
    let logger = Logger.shared(named: "SAPFioriBanner")

    private init() {}

    func showMessageOnTopBanners(_ text: String) {
        DispatchQueue.main.async {
            for (_, banner) in self.messageBanners {
                banner.titleLabel.text = text
            }
        }
    }

    func showTopBanner() {
        DispatchQueue.main.async {
            let scenes = UIApplication.shared.connectedScenes
            for scene in scenes {
                let sceneSessionID = scene.session.persistentIdentifier
                if self.messageBanners[sceneSessionID] == nil {
                    _ = self.topBanner(for: sceneSessionID)
                }
                guard let messageView = self.messageBanners[sceneSessionID] else {
                    continue
                }
                if messageView.superview != nil {
                    self.logger.debug("Top banner already present for scene \(sceneSessionID)")
                    continue
                }
                guard let sceneDelegate = scene.delegate as? UIWindowSceneDelegate, let window = sceneDelegate.window, let window else {
                    continue
                }
                window.addSubview(messageView)
                window.bringSubviewToFront(messageView)
                messageView.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor).isActive = true
                messageView.leftAnchor.constraint(equalTo: window.safeAreaLayoutGuide.leftAnchor).isActive = true
                messageView.rightAnchor.constraint(equalTo: window.safeAreaLayoutGuide.rightAnchor).isActive = true
                self.logger.debug("Added top banner to the window of scene \(sceneSessionID)")
            }
        }
    }

    func hideTopBanner() {
        guard !messageBanners.isEmpty else {
            logger.debug("No Message Banner to hide. Messsage banner list is empty")
            return
        }
        DispatchQueue.main.async {
            self.messageBanners.forEach { $0.value.removeFromSuperview() }
            self.messageBanners = [:]
            self.logger.debug("Removed all the message banners.")
        }
    }

    func topBanner(for sceneSessionID: String) -> FUIBannerMessageView? {
        var banner = messageBanners[sceneSessionID]
        let alreadyAdded = (banner != nil)
        if !alreadyAdded {
            banner = FUIProgressBannerMessageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            banner?.translatesAutoresizingMaskIntoConstraints = false
            messageBanners[sceneSessionID] = banner
        }
        banner?.titleLabel.text = LocalizedStrings.OfflineOData.synchronizingDataMessage

        let rotationAnimation = self.rotationAnimation()
        if let topBanner = banner as? FUIProgressBannerMessageView {
            topBanner.syncIcon.layer.add(rotationAnimation, forKey: "rotationAnimation")
            logger.debug("added rotational animation to top banner view")
        }
        return banner
    }

    fileprivate func rotationAnimation() -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = Float(-Double.pi * 2)
        rotationAnimation.duration = 1
        rotationAnimation.repeatCount = Float.infinity
        #if swift(>=4.2)
            rotationAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        #else
            rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        #endif
        return rotationAnimation
    }
}
