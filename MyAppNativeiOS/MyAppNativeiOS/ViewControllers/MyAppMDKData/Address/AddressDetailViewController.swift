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

class AddressDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    var dataService: MyAppMDKData!
    var loadEntityBlock: (() async throws -> MyAppMDKDataFmwk.Address)?
    private var validity = [String: Bool]()
    var allowsEditableCells = false

    private var _entity: MyAppMDKDataFmwk.Address?
    var entity: MyAppMDKDataFmwk.Address {
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

    private let logger = Logger.shared(named: "AddressMasterViewControllerLogger")
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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return cellForHouseNumber(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Address.houseNumber)
        case 1:
            return cellForStreet(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Address.street)
        case 2:
            return cellForCity(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Address.city)
        case 3:
            return cellForCountry(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Address.country)
        case 4:
            return cellForPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: MyAppMDKDataFmwk.Address.postalCode)
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

    private func cellForHouseNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Address, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Address.houseNumber.isOptional || newValue != "" {
                    currentEntity.houseNumber = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid

            return isNewValueValid
        })
    }

    private func cellForStreet(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Address, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Address.street.isOptional || newValue != "" {
                    currentEntity.street = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid

            return isNewValueValid
        })
    }

    private func cellForCity(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Address, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Address.city.isOptional || newValue != "" {
                    currentEntity.city = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid

            return isNewValueValid
        })
    }

    private func cellForCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Address, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Address.country.isOptional || newValue != "" {
                    currentEntity.country = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid

            return isNewValueValid
        })
    }

    private func cellForPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: MyAppMDKDataFmwk.Address, property: Property) -> UITableViewCell {
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
                if MyAppMDKDataFmwk.Address.postalCode.isOptional || newValue != "" {
                    currentEntity.postalCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid

            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

    func createEntityWithDefaultValues() -> MyAppMDKDataFmwk.Address {
        return MyAppMDKDataFmwk.Address()
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
}
