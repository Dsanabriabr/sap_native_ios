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

class ProductDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    var dataService: MyAppMDKData!
    var loadEntityBlock: (() async throws -> MyAppMDKDataFmwk.Product)?
    private var validity = [String: Bool]()
    var allowsEditableCells = false

    private var _entity: MyAppMDKDataFmwk.Product?
    var entity: MyAppMDKDataFmwk.Product {
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

    private let logger = Logger.shared(named: "ProductMasterViewControllerLogger")
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
            let detailViewController = dest.viewControllers[0] as! ProductDetailViewController
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
            return cellForCategory(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.category)
        case 1:
            return cellForCategoryName(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.categoryName)
        case 2:
            return cellForCurrencyCode(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.currencyCode)
        case 3:
            return cellForDimensionDepth(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.dimensionDepth)
        case 4:
            return cellForDimensionHeight(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.dimensionHeight)
        case 5:
            return cellForDimensionUnit(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.dimensionUnit)
        case 6:
            return cellForDimensionWidth(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.dimensionWidth)
        case 7:
            return cellForLongDescription(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.longDescription)
        case 8:
            return cellForName(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.name)
        case 9:
            return cellForPictureUrl(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.pictureUrl)
        case 10:
            return cellForPrice(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.price)
        case 11:
            return cellForProductID(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.productID)
        case 12:
            return cellForQuantityUnit(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.quantityUnit)
        case 13:
            return cellForShortDescription(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.shortDescription)
        case 14:
            return cellForSupplierID(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.supplierID)
        case 15:
            return cellForWeight(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.weight)
        case 16:
            return cellForWeightUnit(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Product.weightUnit)
        case 17:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "Supplier"
            if entity.isNew {
                cell.title.textColor = UIColor.preferredFioriColor(forStyle: .primaryLabel)
            }
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell
        case 18:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "Stock"
            if entity.isNew {
                cell.title.textColor = UIColor.preferredFioriColor(forStyle: .primaryLabel)
            }
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell
        case 19:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "PurchaseOrderItems"
            if entity.isNew {
                cell.title.textColor = UIColor.preferredFioriColor(forStyle: .primaryLabel)
            }
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell
        case 20:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "SalesOrderItems"
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
        return 21
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if preventNavigationLoop {
            AlertHelper.displayAlert(with: NSLocalizedString("keyAlertNavigationLoop", value: "No further navigation is possible.", comment: "XTIT: Title of alert message about preventing navigation loop."), error: nil, viewController: self)
            return
        }
        switch indexPath.row {
        case 17:
            if !entity.isNew {
                showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "Supplier", bundle: nil)
                let destinationDetailVC = destinationStoryBoard.instantiateViewController(withIdentifier: "SupplierDetailViewController") as! SupplierDetailViewController
                func loadProperty() async throws -> MyAppMDKDataFmwk.Supplier {
                    try await dataService.loadProperty(MyAppMDKDataFmwk.Product.supplier, into: entity)
                    hideFioriLoadingIndicator()
                    guard let supplier = entity.supplier else {
                        let error = NSError(domain: "No entity data found!", code: 0)
                        throw error
                    }
                    return supplier
                }

                destinationDetailVC.loadEntityBlock = loadProperty
                destinationDetailVC.navigationItem.leftItemsSupplementBackButton = true
                destinationDetailVC.navigationItem.title = "Supplier"
                destinationDetailVC.allowsEditableCells = false
                destinationDetailVC.preventNavigationLoop = true
                destinationDetailVC.dataService = dataService
                navigationController?.pushViewController(destinationDetailVC, animated: true)
            }
        case 18:
            if !entity.isNew {
                showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "Stock", bundle: nil)
                let destinationDetailVC = destinationStoryBoard.instantiateViewController(withIdentifier: "StockDetailViewController") as! StockDetailViewController
                func loadProperty() async throws -> MyAppMDKDataFmwk.Stock {
                    try await dataService.loadProperty(MyAppMDKDataFmwk.Product.stock, into: entity)
                    hideFioriLoadingIndicator()
                    guard let stock = entity.stock else {
                        let error = NSError(domain: "No entity data found!", code: 0)
                        throw error
                    }
                    return stock
                }

                destinationDetailVC.loadEntityBlock = loadProperty
                destinationDetailVC.navigationItem.leftItemsSupplementBackButton = true
                destinationDetailVC.navigationItem.title = "Stock"
                destinationDetailVC.allowsEditableCells = false
                destinationDetailVC.preventNavigationLoop = true
                destinationDetailVC.dataService = dataService
                navigationController?.pushViewController(destinationDetailVC, animated: true)
            }
        case 19:
            if !entity.isNew {
                showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "PurchaseOrderItem", bundle: nil)
                let masterViewController = destinationStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderItemMaster")
                func loadProperty() async throws -> [MyAppMDKDataFmwk.PurchaseOrderItem] {
                    try await dataService.loadProperty(MyAppMDKDataFmwk.Product.purchaseOrderItems, into: entity)
                    hideFioriLoadingIndicator()
                    return entity.purchaseOrderItems
                }
                (masterViewController as! PurchaseOrderItemMasterViewController).loadEntitiesBlock = loadProperty
                masterViewController.navigationItem.title = "PurchaseOrderItems"
                (masterViewController as! PurchaseOrderItemMasterViewController).preventNavigationLoop = true
                (masterViewController as! PurchaseOrderItemMasterViewController).dataService = dataService
                navigationController?.pushViewController(masterViewController, animated: true)
            }
        case 20:
            if !entity.isNew {
                showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "SalesOrderItem", bundle: nil)
                let masterViewController = destinationStoryBoard.instantiateViewController(withIdentifier: "SalesOrderItemMaster")
                func loadProperty() async throws -> [MyAppMDKDataFmwk.SalesOrderItem] {
                    try await dataService.loadProperty(MyAppMDKDataFmwk.Product.salesOrderItems, into: entity)
                    hideFioriLoadingIndicator()
                    return entity.salesOrderItems
                }
                (masterViewController as! SalesOrderItemMasterViewController).loadEntitiesBlock = loadProperty
                masterViewController.navigationItem.title = "SalesOrderItems"
                (masterViewController as! SalesOrderItemMasterViewController).preventNavigationLoop = true
                (masterViewController as! SalesOrderItemMasterViewController).dataService = dataService
                navigationController?.pushViewController(masterViewController, animated: true)
            }
        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForCategory(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Product.category.isOptional || newValue != "" {
                    currentEntity.category = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCategoryName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Product.categoryName.isOptional || newValue != "" {
                    currentEntity.categoryName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCurrencyCode(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Product.currencyCode.isOptional || newValue != "" {
                    currentEntity.currencyCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDimensionDepth(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dimensionDepth {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.dimensionDepth = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.dimensionDepth = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDimensionHeight(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dimensionHeight {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.dimensionHeight = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.dimensionHeight = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDimensionUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dimensionUnit {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.dimensionUnit = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Product.dimensionUnit.isOptional || newValue != "" {
                    currentEntity.dimensionUnit = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDimensionWidth(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dimensionWidth {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.dimensionWidth = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.dimensionWidth = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForLongDescription(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.longDescription {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.longDescription = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Product.longDescription.isOptional || newValue != "" {
                    currentEntity.longDescription = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.name {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.name = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Product.name.isOptional || newValue != "" {
                    currentEntity.name = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPictureUrl(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.pictureUrl {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.pictureUrl = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Product.pictureUrl.isOptional || newValue != "" {
                    currentEntity.pictureUrl = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPrice(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.price {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.price = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.price = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForProductID(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
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

    private func cellForQuantityUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Product.quantityUnit.isOptional || newValue != "" {
                    currentEntity.quantityUnit = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShortDescription(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shortDescription {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shortDescription = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Product.shortDescription.isOptional || newValue != "" {
                    currentEntity.shortDescription = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSupplierID(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.supplierID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.supplierID = nil
                isNewValueValid = true
            } else {
                if let validValue = Int64(newValue) {
                    currentEntity.supplierID = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForWeight(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.weight {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.weight = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.weight = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForWeightUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Product, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.weightUnit {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.weightUnit = nil
                isNewValueValid = true
            } else {
                if MyAppMDKDataFmwk.Product.weightUnit.isOptional || newValue != "" {
                    currentEntity.weightUnit = newValue
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

    func createEntityWithDefaultValues() -> MyAppMDKDataFmwk.Product {
        let newEntity = MyAppMDKDataFmwk.Product()

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.productID == nil {
            validity["ProductID"] = false
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

extension ProductDetailViewController: MyAppMDKDataEntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! MyAppMDKDataFmwk.Product
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
