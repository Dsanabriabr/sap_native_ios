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

class CustomerDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    var dataService: MyAppMDKData!
    var loadEntityBlock: (() async throws -> MyAppMDKDataFmwk.Customer)?
    private var validity = [String: Bool]()
    var allowsEditableCells = false

    private var _entity: MyAppMDKDataFmwk.Customer?
    var entity: MyAppMDKDataFmwk.Customer {
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

    private let logger = Logger.shared(named: "CustomerMasterViewControllerLogger")
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
            let detailViewController = dest.viewControllers[0] as! CustomerDetailViewController
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
            return cellForCity(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.city)
        case 1:
            return cellForCountry(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.country)
        case 2:
            return cellForCustomerID(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.customerID)
        case 3:
            return cellForEmailAddress(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.emailAddress)
        case 4:
            return cellForFirstName(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.firstName)
        case 5:
            return cellForHouseNumber(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.houseNumber)
        case 6:
            return cellForLastName(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.lastName)
        case 7:
            return cellForPhoneNumber(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.phoneNumber)
        case 8:
            return cellForPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.postalCode)
        case 9:
            return cellForStreet(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Customer.street)
        case 10:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "SalesOrders"
            if entity.isNew {
                cell.title.textColor = UIColor.preferredFioriColor(forStyle: .primaryLabel)
            }
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell
        case 11:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "Address"

            cell.title.textColor = UIColor.preferredFioriColor(forStyle: .primaryLabel)

            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 12
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if preventNavigationLoop {
            AlertHelper.displayAlert(with: NSLocalizedString("keyAlertNavigationLoop", value: "No further navigation is possible.", comment: "XTIT: Title of alert message about preventing navigation loop."), error: nil, viewController: self)
            return
        }
        switch indexPath.row {
        case 10:
            if !entity.isNew {
                showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "SalesOrderHeader", bundle: nil)
                let masterViewController = destinationStoryBoard.instantiateViewController(withIdentifier: "SalesOrderHeaderMaster")
                func loadProperty() async throws -> [MyAppMDKDataFmwk.SalesOrderHeader] {
                    try await dataService.loadProperty(MyAppMDKDataFmwk.Customer.salesOrders, into: entity)
                    hideFioriLoadingIndicator()
                    return entity.salesOrders
                }
                (masterViewController as! SalesOrderHeaderMasterViewController).loadEntitiesBlock = loadProperty
                masterViewController.navigationItem.title = "SalesOrders"
                (masterViewController as! SalesOrderHeaderMasterViewController).preventNavigationLoop = true
                (masterViewController as! SalesOrderHeaderMasterViewController).dataService = dataService
                navigationController?.pushViewController(masterViewController, animated: true)
            }

        case 11:
            showFioriLoadingIndicator()
            let destinationStoryBoard = UIStoryboard(name: "Address", bundle: nil)
            let destinationDetailVC = destinationStoryBoard.instantiateViewController(withIdentifier: "AddressDetailViewController") as! AddressDetailViewController
            func loadProperty() async throws -> MyAppMDKDataFmwk.Address {
                hideFioriLoadingIndicator()
                guard let address = entity.address else {
                    let error = NSError(domain: "No entity data found!", code: 0)
                    throw error
                }
                return address
            }

            destinationDetailVC.loadEntityBlock = loadProperty
            destinationDetailVC.navigationItem.leftItemsSupplementBackButton = true
            destinationDetailVC.navigationItem.title = "Address"
            destinationDetailVC.allowsEditableCells = allowsEditableCells
            destinationDetailVC.preventNavigationLoop = true
            destinationDetailVC.dataService = dataService
            navigationController?.pushViewController(destinationDetailVC, animated: true)

        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForCity(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.city {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.city = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.city.isOptional || newValue != "" {
                    currentEntity.city = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.country {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.country = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.country.isOptional || newValue != "" {
                    currentEntity.country = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCustomerID(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.customerID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.customerID = nil
                isNewValueValid = true
            } else {
                if let validValue = Int64(newValue) {
                    currentEntity.customerID = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForEmailAddress(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.emailAddress {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.emailAddress = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.emailAddress.isOptional || newValue != "" {
                    currentEntity.emailAddress = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForFirstName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.firstName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.firstName = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.firstName.isOptional || newValue != "" {
                    currentEntity.firstName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForHouseNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.houseNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.houseNumber = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.houseNumber.isOptional || newValue != "" {
                    currentEntity.houseNumber = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForLastName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.lastName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.lastName = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.lastName.isOptional || newValue != "" {
                    currentEntity.lastName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPhoneNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.phoneNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.phoneNumber = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.phoneNumber.isOptional || newValue != "" {
                    currentEntity.phoneNumber = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.postalCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.postalCode = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.postalCode.isOptional || newValue != "" {
                    currentEntity.postalCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForStreet(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.street {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.street = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Customer.street.isOptional || newValue != "" {
                    currentEntity.street = newValue
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

    func createEntityWithDefaultValues() -> MyAppMDKDataFmwk.Customer {
        let newEntity = MyAppMDKDataFmwk.Customer()

        newEntity.address = MyAppMDKDataFmwk.Address()

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.customerID == nil {
            validity["CustomerID"] = false
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

extension CustomerDetailViewController: MyAppMDKDataEntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! MyAppMDKDataFmwk.Customer
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
