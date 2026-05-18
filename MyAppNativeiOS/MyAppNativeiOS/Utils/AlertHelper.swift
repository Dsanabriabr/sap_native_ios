//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import Foundation
import UIKit

class AlertHelper {
    static let okTitle = NSLocalizedString("keyOkButtonTitle",
                                           value: "OK",
                                           comment: "XBUT: Title of OK button.")

    static func displayAlert(with title: String, message: String? = nil, error: Error? = nil, buttonTitle: String = AlertHelper.okTitle, viewController: UIViewController, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message ?? error?.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
            completion?()
        }))
        DispatchQueue.main.async {
            // Present the alertController
            viewController.present(alertController, animated: true)
        }
    }
}
