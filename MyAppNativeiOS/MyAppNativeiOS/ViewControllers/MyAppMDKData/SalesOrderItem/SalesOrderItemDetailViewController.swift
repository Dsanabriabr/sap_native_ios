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

class SalesOrderItemDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    var dataService: MyAppMDKData!
    var loadEntityBlock: (() async throws -> MyAppMDKDataFmwk.SalesOrderItem)?
    private var validity = [String: Bool]()
    var allowsEditableCells = false

    private var _entity: MyAppMDKDataFmwk.SalesOrderItem?
    var entity: MyAppMDKDataFmwk.SalesOrderItem {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue
        }
    }

    private let logger = Logger.shared(named: "SalesOrderItemMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var entityUpdater: MyAppMDKDataEntityUpdaterDelegate?
    var tableUpdater: MyAppMDKDataEntitySetUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var preventNavigationLoop = false
    var entitySetName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        loadEntity()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "updateEntity" {
            // Show the Detail view with the current entity, where the properties scan be edited and updated
            logger.info("Showing a view to update the selected entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! SalesOrderItemDetailViewController
            detailViewController.title = NSLocalizedString("keyUpdateEntityTitle", value: "Update Entity", comment: "XTIT: Title of update selected entity screen.")
            detailViewController.dataService = dataService
            detailViewController.entity = entity
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.updateEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.entityUpdater = self
            detailViewController.tableUpdater = tableUpdater
            detailViewController.entitySetName = entitySetName
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return cellForCurrencyCode(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.currencyCode)
        case 1:
            return cellForGrossAmount(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.grossAmount)
        case 2:
            return cellForItemNumber(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.itemNumber)
        case 3:
            return cellForNetAmount(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.netAmount)
        case 4:
            return cellForProductID(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.productID)
        case 5:
            return cellForQuantity(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.quantity)
        case 6:
            return cellForQuantityUnit(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.quantityUnit)
        case 7:
            return cellForSalesOrderID(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.salesOrderID)
        case 8:
            return cellForTaxAmount(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.SalesOrderItem.taxAmount)
        case 9:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "Product"
            if entity.isNew {
                cell.title.textColor = UIColor.preferredFioriColor(forStyle: .primaryLabel)
            }
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell
        case 10:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "Header"
            if entity.isNew {
                cell.title.textColor = UIColor.preferredFioriColor(forStyle: .primaryLabel)
            }
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 11
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if preventNavigationLoop {
            AlertHelper.displayAlert(with: NSLocalizedString("keyAlertNavigationLoop", value: "No further navigation is possible.", comment: "XTIT: Title of alert message about preventing navigation loop."), error: nil, viewController: self)
            return
        }
        switch indexPath.row {
        case 9:
            if !entity.isNew {
                showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "Product", bundle: nil)
                let destinationDetailVC = destinationStoryBoard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
                func loadProperty() async throws -> MyAppMDKDataFmwk.Product {
                    try await dataService.loadProperty(MyAppMDKDataFmwk.SalesOrderItem.product, into: entity)
                    hideFioriLoadingIndicator()
                    guard let product = entity.product else {
                        let error = NSError(domain: "No entity data found!", code: 0)
                        throw error
                    }
                    return product
                }

                destinationDetailVC.loadEntityBlock = loadProperty
                destinationDetailVC.navigationItem.leftItemsSupplementBackButton = true
                destinationDetailVC.navigationItem.title = "Product"
                destinationDetailVC.allowsEditableCells = false
                destinationDetailVC.preventNavigationLoop = true
                destinationDetailVC.dataService = dataService
                navigationController?.pushViewController(destinationDetailVC, animated: true)
            }
        case 10:
            if !entity.isNew {
                showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "SalesOrderHeader", bundle: nil)
                let destinationDetailVC = destinationStoryBoard.instantiateViewController(withIdentifier: "SalesOrderHeaderDetailViewController") as! SalesOrderHeaderDetailViewController
                func loadProperty() async throws -> MyAppMDKDataFmwk.SalesOrderHeader {
                    try await dataService.loadProperty(MyAppMDKDataFmwk.SalesOrderItem.header, into: entity)
                    hideFioriLoadingIndicator()
                    guard let header = entity.header else {
                        let error = NSError(domain: "No entity data found!", code: 0)
                        throw error
                    }
                    return header
                }

                destinationDetailVC.loadEntityBlock = loadProperty
                destinationDetailVC.navigationItem.leftItemsSupplementBackButton = true
                destinationDetailVC.navigationItem.title = "Header"
                destinationDetailVC.allowsEditableCells = false
                destinationDetailVC.preventNavigationLoop = true
                destinationDetailVC.dataService = dataService
                navigationController?.pushViewController(destinationDetailVC, animated: true)
            }
        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForCurrencyCode(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.currencyCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.currencyCode = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.SalesOrderItem.currencyCode.isOptional || newValue != "" {
                    currentEntity.currencyCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGrossAmount(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.grossAmount {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.grossAmount = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.grossAmount = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForItemNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.itemNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.itemNumber = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.itemNumber = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForNetAmount(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.netAmount {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.netAmount = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.netAmount = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForProductID(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.productID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.productID = nil
                isNewValueValid = true
            } else {
                if let validValue = Int64(newValue) {
                    currentEntity.productID = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForQuantity(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.quantity {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.quantity = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.quantity = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForQuantityUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.quantityUnit {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.quantityUnit = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.SalesOrderItem.quantityUnit.isOptional || newValue != "" {
                    currentEntity.quantityUnit = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSalesOrderID(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.salesOrderID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.salesOrderID = nil
                isNewValueValid = true
            } else {
                if let validValue = Int64(newValue) {
                    currentEntity.salesOrderID = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForTaxAmount(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.SalesOrderItem, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.taxAmount {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.taxAmount = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.taxAmount = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

    @objc func createEntity() {
        showFioriLoadingIndicator()
        view.endEditing(true)
        logger.info("Creating entity in backend.")
        Task {
            do {
                if let entitySetName = self.entitySetName {
                    let entitySet = dataService.entitySet(withName: entitySetName)
                    if entitySet.isLocalDraft {
                        _ = entity.asDraft()
                    }
                    _ = entity.inSet(entitySet)
                }
                try await self.dataService.createEntity(self.entity)
                self.hideFioriLoadingIndicator()
            } catch {
                self.hideFioriLoadingIndicator()
                self.logger.error("Create entry failed. Error: \(error)", error: error)
                AlertHelper.displayAlert(with: NSLocalizedString("keyErrorEntityCreationTitle", value: "Create entry failed", comment: "XTIT: Title of alert message about entity creation error."), error: error, viewController: self)
                return
            }

            await MainActor.run {
                self.logger.info("Create entry finished successfully.")
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyEntityCreationBody", value: "Created", comment: "XMSG: Title of alert message about successful entity creation."))
                    self.tableUpdater?.entitySetHasChanged()
                }
            }
        }
    }

    @objc func activateDraftEntity() {
        showFioriLoadingIndicator()
        Task {
            do {
                guard let entitySetName = self.entitySetName else {
                    self.hideFioriLoadingIndicator()
                    return
                }
                let entitySet = dataService.entitySet(withName: entitySetName)
                let draftEntity = self.entity.withDeepCreate()
                _ = try await self.dataService.activateDraft(draftEntity.inSet(entitySet))
                self.hideFioriLoadingIndicator()
            } catch {
                self.hideFioriLoadingIndicator()
                self.logger.error("Activate Draft failed. Error: \(error)", error: error)
                AlertHelper.displayAlert(with: NSLocalizedString("keyErrorActivateDraftTitle", value: "Activating draft failed", comment: "XTIT: Title of alert message about draft entity activation error."), error: error, viewController: self)
                return
            }
            self.logger.info("Activation of Draft finished successfully.")
            await MainActor.run {
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyActivateDraftFinished", value: "Activated Draft", comment: "XMSG: Title of alert message about successful draft entity activation."))
                    self.tableUpdater?.entitySetHasChanged()
                }
            }
        }
    }

    func createEntityWithDefaultValues() -> MyAppMDKDataFmwk.SalesOrderItem {
        let newEntity = MyAppMDKDataFmwk.SalesOrderItem()

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.itemNumber == nil {
            validity["ItemNumber"] = false
        }
        if newEntity.salesOrderID == nil {
            validity["SalesOrderID"] = false
        }

        barButtonShouldBeEnabled()
        return newEntity
    }

    @objc func updateEntity(_: AnyObject) {
        showFioriLoadingIndicator()
        view.endEditing(true)
        logger.info("Updating entity in backend.")
        Task {
            do {
                if let entitySetName = self.entitySetName {
                    let entitySet = dataService.entitySet(withName: entitySetName)
                    if entitySet.isLocalDraft {
                        _ = entity.asDraft()
                    }
                    _ = entity.inSet(entitySet)
                }
                try await self.dataService.updateEntity(self.entity)
                self.hideFioriLoadingIndicator()
            } catch {
                self.hideFioriLoadingIndicator()
                self.logger.error("Update entry failed. Error: \(error)", error: error)
                AlertHelper.displayAlert(with: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), error: error, viewController: self)
                return
            }

            await MainActor.run {
                self.logger.info("Update entry finished successfully.")
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
                    self.entityUpdater?.entityHasChanged(self.entity)
                }
            }
        }
    }

    func loadEntity() {
        showFioriLoadingIndicator()
        Task.detached {
            do {
                try await self.requestEntity()
            } catch {
                self.hideFioriLoadingIndicator()
                AlertHelper.displayAlert(with: NSLocalizedString("keyErrorLoadingData", value: "Loading data failed!", comment: "XTIT: Title of loading data error pop up."), error: error, viewController: self)
                await self.logger.error("Could not load customer data.", error: error)
                return
            }
            await MainActor.run {
                self.tableView.reloadData()
                self.logger.info("Data updated successfully!")
            }
            self.hideFioriLoadingIndicator()
        }
    }

    func requestEntity() async throws {
        if let entityBlock = loadEntityBlock {
            entity = try await entityBlock()
        }
    }

    // MARK: - other logic, helper

    @objc func cancel() {
        showFioriLoadingIndicator()
        view.endEditing(true)
        Task {
            do {
                try await dataService.loadEntity(entity)
            } catch {
                self.logger.warn("Load entity failed on cancel. Shown cached data may not be reflective of the backend.")
            }
            self.hideFioriLoadingIndicator()
            await MainActor.run {
                self.dismiss(animated: true)
            }
        }
    }

    /// Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = validity.values.first { field in
            field == false
        }
        navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
}

extension SalesOrderItemDetailViewController: MyAppMDKDataEntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! MyAppMDKDataFmwk.SalesOrderItem
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
