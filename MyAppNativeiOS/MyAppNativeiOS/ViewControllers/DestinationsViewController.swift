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
import UIKit

class DestinationsViewController: FUIFormTableViewController {
    let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
    lazy var odataServiceNames = destinations.allKeys as! [String]
    private let logger = Logger.shared(named: "DestinationsViewController")

    override func viewDidLoad() {
        super.viewDidLoad()

        configureMenuItems()
    }

    private func configureMenuItems() {
        func synchronize(action _: UIAction) {
            guard let myAppMDKDataOdataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[ODataContainerType.myAppMDKData.description] as? MyAppMDKDataOfflineODataController else {
                AlertHelper.displayAlert(with: "OData service is not reachable, please onboard again.", error: nil, viewController: self)
                return
            }
            if ConnectivityUtils.isConnected() {
                Task {
                    do {
                        SAPFioriBannerHandler.shared.showTopBanner()

                        try await myAppMDKDataOdataController.synchronize()
                    } catch {
                        self.logger.error("Synchronize failed")
                    }
                    SAPFioriBannerHandler.shared.hideTopBanner()
                }
            } else {
                AlertHelper.displayAlert(with: LocalizedStrings.OfflineOData.networkUnavailableMessage, error: "Please check your connection and try again.", viewController: self)
                logger.warn("Synchronize failed")
            }
        }

        let barButtonMenu = UIMenu(title: "", options: .displayInline, children: [
            UIAction(title: NSLocalizedString("Synchronize", comment: ""), image: UIImage(systemName: "arrow.triangle.2.circlepath"), handler: synchronize),
        ])

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), menu: barButtonMenu)
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return odataServiceNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationCell", for: indexPath)
        cell.textLabel?.text = odataServiceNames[indexPath.row]
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleClick(at: indexPath)
    }

    func handleClick(at indexPath: IndexPath) {
        let selectedODataService = odataServiceNames[indexPath.row]
        let collectionStoryBoard = UIStoryboard(name: selectedODataService, bundle: nil)
        let collectionViewController = collectionStoryBoard.instantiateViewController(withIdentifier: "\(selectedODataService)CollectionsView")
        navigationController?.pushViewController(collectionViewController, animated: true)
    }
}
