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

class ProductCategoryDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    var dataService: MyAppMDKData!
    var loadEntityBlock: (() async throws -> MyAppMDKDataFmwk.ProductCategory)?
    private var validity = [String: Bool]()
    var allowsEditableCells = false

    private var _entity: MyAppMDKDataFmwk.ProductCategory?
    var entity: MyAppMDKDataFmwk.ProductCategory {
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

    private let logger = Logger.shared(named: "ProductCategoryMasterViewControllerLogger")
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
            let detailViewController = dest.viewControllers[0] as! ProductCategoryDetailViewController
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
            return cellForCategory(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.ProductCategory.category)
        case 1:
            return cellForCategoryName(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.ProductCategory.categoryName)
        case 2:
            return cellForMainCategory(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.ProductCategory.mainCategory)
        case 3:
            return cellForMainCategoryName(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.ProductCategory.mainCategoryName)
        case 4:
            return cellForNumberOfProducts(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.ProductCategory.numberOfProducts)
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 5
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if preventNavigationLoop {
            AlertHelper.displayAlert(with: NSLocalizedString("keyAlertNavigationLoop", value: "No further navigation is possible.", comment: "XTIT: Title of alert message about preventing navigation loop."), error: nil, viewController: self)
            return
        }
        switch indexPath.row {
        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForCategory(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.ProductCategory, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.category {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.category = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.ProductCategory.category.isOptional || newValue != "" {
                    currentEntity.category = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCategoryName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.ProductCategory, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.categoryName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.categoryName = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.ProductCategory.categoryName.isOptional || newValue != "" {
                    currentEntity.categoryName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForMainCategory(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.ProductCategory, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.mainCategory {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.mainCategory = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.ProductCategory.mainCategory.isOptional || newValue != "" {
                    currentEntity.mainCategory = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForMainCategoryName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.ProductCategory, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.mainCategoryName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.mainCategoryName = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.ProductCategory.mainCategoryName.isOptional || newValue != "" {
                    currentEntity.mainCategoryName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForNumberOfProducts(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.ProductCategory, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.numberOfProducts {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.numberOfProducts = nil
                isNewValueValid = true
            } else {
                if let validValue = Int64(newValue) {
                    currentEntity.numberOfProducts = validValue
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

    func createEntityWithDefaultValues() -> MyAppMDKDataFmwk.ProductCategory {
        let newEntity = MyAppMDKDataFmwk.ProductCategory()

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.category == nil || newEntity.category!.isEmpty {
            validity["Category"] = false
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

extension ProductCategoryDetailViewController: MyAppMDKDataEntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! MyAppMDKDataFmwk.ProductCategory
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
