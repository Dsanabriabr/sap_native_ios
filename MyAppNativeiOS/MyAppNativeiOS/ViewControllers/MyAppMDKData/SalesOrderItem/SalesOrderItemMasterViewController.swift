//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import Foundation
import MyAppMDKDataFmwk
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData
import SAPOfflineOData

class SalesOrderItemMasterViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    var dataService: MyAppMDKData!
    var loadEntitiesBlock: (() async throws -> [MyAppMDKDataFmwk.SalesOrderItem])?
    private var entities: [MyAppMDKDataFmwk.SalesOrderItem] = .init()
    private let logger = Logger.shared(named: "SalesOrderItemMasterViewControllerLogger")
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var loadingIndicator: FUILoadingIndicatorView?
    private let dispatchGroup = DispatchGroup()

    private var isLocalDraft: Bool = false
    private var isClientOnly: Bool = false

    private func addTableHeaderView() {
        let tableHeader = FUIObjectHeader()
        tableHeader.headlineText = "SalesOrderItem"

        if let entitySetName = entitySetName {
            isLocalDraft = dataService.entitySet(withName: entitySetName).isLocalDraft
            isClientOnly = dataService.entitySet(withName: entitySetName).isClientOnly
        }
        if isLocalDraft {
            tableHeader.tags.append(FUITag(title: "LocalDraft"))
        }
        if isClientOnly {
            tableHeader.tags.append(FUITag(title: "ClientOnly"))
        }
        tableView.tableHeaderView = tableHeader
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add refreshcontrol UI
        refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl!)
        // Cell height settings
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 98
        updateTable()
        addTableHeaderView()
    }

    var preventNavigationLoop = false
    var entitySetName: String?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearsSelectionOnViewWillAppear = splitViewController?.isCollapsed ?? false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return entities.count
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let salesOrderItem = entities[indexPath.row]

        return CellCreationHelper.objectCellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: "ItemNumber, SalesOrderID", value: "\(salesOrderItem.itemNumber!), \(salesOrderItem.salesOrderID!)")
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {
            return
        }
        let currentEntity = entities[indexPath.row]
        Task {
            do {
                try await self.dataService.deleteEntity(currentEntity)
            } catch {
                self.logger.error("Delete entry failed.", error: error)
                AlertHelper.displayAlert(with: NSLocalizedString("keyErrorDeletingEntryTitle", value: "Delete entry failed", comment: "XTIT: Title of deleting entry error pop up."), error: error, viewController: self)
                return
            }

            self.entities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Data accessing

    func requestEntities() async throws {
        entities = try await loadEntitiesBlock!().sorted(by: { ($0.itemNumber!, $0.salesOrderID!) < ($1.itemNumber!, $1.salesOrderID!) })
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "showDetail" {
            // Show the selected Entity on the Detail view
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            logger.info("Showing details of the chosen element.")
            let selectedEntity = entities[indexPath.row]
            let detailViewController = segue.destination as! SalesOrderItemDetailViewController
            detailViewController.entity = selectedEntity
            detailViewController.navigationItem.leftItemsSupplementBackButton = true
            detailViewController.navigationItem.title = "\(entities[(tableView.indexPathForSelectedRow?.row)!].itemNumber != nil ? "\(entities[(tableView.indexPathForSelectedRow?.row)!].itemNumber!)" : "")"
            detailViewController.allowsEditableCells = false
            detailViewController.tableUpdater = self
            detailViewController.preventNavigationLoop = preventNavigationLoop
            detailViewController.dataService = dataService
            detailViewController.entitySetName = entitySetName
            if isLocalDraft {
                detailViewController.navigationItem.rightBarButtonItems?.append(UIBarButtonItem(barButtonSystemItem: .action, target: detailViewController, action: #selector(detailViewController.activateDraftEntity)))
            }
        } else if segue.identifier == "addEntity" {
            // Show the Detail view with a new Entity, which can be filled to create on the server
            logger.info("Showing view to add new entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! SalesOrderItemDetailViewController
            detailViewController.title = NSLocalizedString("keyAddEntityTitle", value: "Add Entity", comment: "XTIT: Title of add new entity screen.")
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.createEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.tableUpdater = self
            detailViewController.dataService = dataService
            detailViewController.entitySetName = entitySetName
        }
    }

    // MARK: - Table update

    func updateTable() {
        showFioriLoadingIndicator()
        Task.detached {
            await self.loadData()
            self.hideFioriLoadingIndicator()
        }
    }

    private func loadData() async {
        do {
            try await requestEntities()
        } catch {
            AlertHelper.displayAlert(with: NSLocalizedString("keyErrorLoadingData", value: "Loading data failed!", comment: "XTIT: Title of loading data error pop up."), error: error, viewController: self)
            logger.error("Could not update table.", error: error)
            return
        }
        await MainActor.run {
            self.tableView.reloadData()
            self.logger.info("Table updated successfully!")
        }
    }

    @objc func refresh() {
        Task.detached {
            await self.loadData()
            await MainActor.run {
                self.refreshControl?.endRefreshing()
            }
        }
    }
}

extension SalesOrderItemMasterViewController: MyAppMDKDataEntitySetUpdaterDelegate {
    func entitySetHasChanged() {
        updateTable()
    }
}
