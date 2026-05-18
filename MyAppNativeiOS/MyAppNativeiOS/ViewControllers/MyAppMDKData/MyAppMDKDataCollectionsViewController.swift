//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import MyAppMDKDataFmwk
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData
import SharedFmwk

protocol MyAppMDKDataEntityUpdaterDelegate {
    func entityHasChanged(_ entity: EntityValue?)
}

protocol MyAppMDKDataEntityMediaUpdaterDelegate {
    func entityMediaHasChanged(_ changedMedia: Data?)
}

protocol MyAppMDKDataEntitySetUpdaterDelegate {
    func entitySetHasChanged()
}

protocol MyAppMDKDataEntitySetMediaUpdaterDelegate {
    func entitySetMediaHasChanged(for entity: EntityValue?, to media: Data?)
}

class MyAppMDKDataCollectionsViewController: FUIFormTableViewController {
    private var collections = MyAppMDKDataCollectionType.allCases

    /// Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    var isPresentedInSplitView: Bool {
        return !(splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 320, height: 480)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            for cell in self.tableView.visibleCells {
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = collections[indexPath.row].description
        cell.accessoryType = !isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        collectionSelected(at: indexPath)
    }

    /// CollectionType selection helper
    private func collectionSelected(at indexPath: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard"
        var masterViewController: UIViewController!
        guard let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[ODataContainerType.myAppMDKData.description] as? MyAppMDKDataOfflineODataController, let dataService = odataController.dataService else {
            AlertHelper.displayAlert(with: "OData service is not reachable, please onboard again.", error: nil, viewController: self)
            return
        }
        selectedIndex = indexPath

        switch collections[indexPath.row] {
        case .salesOrderHeaders:
            let salesOrderHeaderStoryBoard = UIStoryboard(name: "SalesOrderHeader", bundle: nil)
            let salesOrderHeaderMasterViewController = salesOrderHeaderStoryBoard.instantiateViewController(withIdentifier: "SalesOrderHeaderMaster") as! SalesOrderHeaderMasterViewController
            salesOrderHeaderMasterViewController.dataService = dataService
            salesOrderHeaderMasterViewController.entitySetName = "SalesOrderHeaders"
            func fetchSalesOrderHeaders() async throws -> [MyAppMDKDataFmwk.SalesOrderHeader] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchSalesOrderHeaders(matching: query)
                }
            }
            salesOrderHeaderMasterViewController.loadEntitiesBlock = fetchSalesOrderHeaders
            salesOrderHeaderMasterViewController.navigationItem.title = "SalesOrderHeaders"
            masterViewController = salesOrderHeaderMasterViewController
        case .products:
            let productStoryBoard = UIStoryboard(name: "Product", bundle: nil)
            let productMasterViewController = productStoryBoard.instantiateViewController(withIdentifier: "ProductMaster") as! ProductMasterViewController
            productMasterViewController.dataService = dataService
            productMasterViewController.entitySetName = "Products"
            func fetchProducts() async throws -> [MyAppMDKDataFmwk.Product] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchProducts(matching: query)
                }
            }
            productMasterViewController.loadEntitiesBlock = fetchProducts
            productMasterViewController.navigationItem.title = "Products"
            masterViewController = productMasterViewController
        case .productTexts:
            let productTextStoryBoard = UIStoryboard(name: "ProductText", bundle: nil)
            let productTextMasterViewController = productTextStoryBoard.instantiateViewController(withIdentifier: "ProductTextMaster") as! ProductTextMasterViewController
            productTextMasterViewController.dataService = dataService
            productTextMasterViewController.entitySetName = "ProductTexts"
            func fetchProductTexts() async throws -> [MyAppMDKDataFmwk.ProductText] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchProductTexts(matching: query)
                }
            }
            productTextMasterViewController.loadEntitiesBlock = fetchProductTexts
            productTextMasterViewController.navigationItem.title = "ProductTexts"
            masterViewController = productTextMasterViewController
        case .customers:
            let customerStoryBoard = UIStoryboard(name: "Customer", bundle: nil)
            let customerMasterViewController = customerStoryBoard.instantiateViewController(withIdentifier: "CustomerMaster") as! CustomerMasterViewController
            customerMasterViewController.dataService = dataService
            customerMasterViewController.entitySetName = "Customers"
            func fetchCustomers() async throws -> [MyAppMDKDataFmwk.Customer] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchCustomers(matching: query)
                }
            }
            customerMasterViewController.loadEntitiesBlock = fetchCustomers
            customerMasterViewController.navigationItem.title = "Customers"
            masterViewController = customerMasterViewController
        case .stock:
            let stockStoryBoard = UIStoryboard(name: "Stock", bundle: nil)
            let stockMasterViewController = stockStoryBoard.instantiateViewController(withIdentifier: "StockMaster") as! StockMasterViewController
            stockMasterViewController.dataService = dataService
            stockMasterViewController.entitySetName = "Stock"
            func fetchStock() async throws -> [MyAppMDKDataFmwk.Stock] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchStock(matching: query)
                }
            }
            stockMasterViewController.loadEntitiesBlock = fetchStock
            stockMasterViewController.navigationItem.title = "Stock"
            masterViewController = stockMasterViewController
        case .purchaseOrderHeaders:
            let purchaseOrderHeaderStoryBoard = UIStoryboard(name: "PurchaseOrderHeader", bundle: nil)
            let purchaseOrderHeaderMasterViewController = purchaseOrderHeaderStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderHeaderMaster") as! PurchaseOrderHeaderMasterViewController
            purchaseOrderHeaderMasterViewController.dataService = dataService
            purchaseOrderHeaderMasterViewController.entitySetName = "PurchaseOrderHeaders"
            func fetchPurchaseOrderHeaders() async throws -> [MyAppMDKDataFmwk.PurchaseOrderHeader] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchPurchaseOrderHeaders(matching: query)
                }
            }
            purchaseOrderHeaderMasterViewController.loadEntitiesBlock = fetchPurchaseOrderHeaders
            purchaseOrderHeaderMasterViewController.navigationItem.title = "PurchaseOrderHeaders"
            masterViewController = purchaseOrderHeaderMasterViewController
        case .salesOrderItems:
            let salesOrderItemStoryBoard = UIStoryboard(name: "SalesOrderItem", bundle: nil)
            let salesOrderItemMasterViewController = salesOrderItemStoryBoard.instantiateViewController(withIdentifier: "SalesOrderItemMaster") as! SalesOrderItemMasterViewController
            salesOrderItemMasterViewController.dataService = dataService
            salesOrderItemMasterViewController.entitySetName = "SalesOrderItems"
            func fetchSalesOrderItems() async throws -> [MyAppMDKDataFmwk.SalesOrderItem] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchSalesOrderItems(matching: query)
                }
            }
            salesOrderItemMasterViewController.loadEntitiesBlock = fetchSalesOrderItems
            salesOrderItemMasterViewController.navigationItem.title = "SalesOrderItems"
            masterViewController = salesOrderItemMasterViewController
        case .productCategories:
            let productCategoryStoryBoard = UIStoryboard(name: "ProductCategory", bundle: nil)
            let productCategoryMasterViewController = productCategoryStoryBoard.instantiateViewController(withIdentifier: "ProductCategoryMaster") as! ProductCategoryMasterViewController
            productCategoryMasterViewController.dataService = dataService
            productCategoryMasterViewController.entitySetName = "ProductCategories"
            func fetchProductCategories() async throws -> [MyAppMDKDataFmwk.ProductCategory] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchProductCategories(matching: query)
                }
            }
            productCategoryMasterViewController.loadEntitiesBlock = fetchProductCategories
            productCategoryMasterViewController.navigationItem.title = "ProductCategories"
            masterViewController = productCategoryMasterViewController
        case .purchaseOrderItems:
            let purchaseOrderItemStoryBoard = UIStoryboard(name: "PurchaseOrderItem", bundle: nil)
            let purchaseOrderItemMasterViewController = purchaseOrderItemStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderItemMaster") as! PurchaseOrderItemMasterViewController
            purchaseOrderItemMasterViewController.dataService = dataService
            purchaseOrderItemMasterViewController.entitySetName = "PurchaseOrderItems"
            func fetchPurchaseOrderItems() async throws -> [MyAppMDKDataFmwk.PurchaseOrderItem] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchPurchaseOrderItems(matching: query)
                }
            }
            purchaseOrderItemMasterViewController.loadEntitiesBlock = fetchPurchaseOrderItems
            purchaseOrderItemMasterViewController.navigationItem.title = "PurchaseOrderItems"
            masterViewController = purchaseOrderItemMasterViewController
        case .suppliers:
            let supplierStoryBoard = UIStoryboard(name: "Supplier", bundle: nil)
            let supplierMasterViewController = supplierStoryBoard.instantiateViewController(withIdentifier: "SupplierMaster") as! SupplierMasterViewController
            supplierMasterViewController.dataService = dataService
            supplierMasterViewController.entitySetName = "Suppliers"
            func fetchSuppliers() async throws -> [MyAppMDKDataFmwk.Supplier] {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll()
                do {
                    return try await dataService.fetchSuppliers(matching: query)
                }
            }
            supplierMasterViewController.loadEntitiesBlock = fetchSuppliers
            supplierMasterViewController.navigationItem.title = "Suppliers"
            masterViewController = supplierMasterViewController
        @unknown default:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell

    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        guard let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[ODataContainerType.myAppMDKData.description] as? MyAppMDKDataOfflineODataController else {
            AlertHelper.displayAlert(with: "OData service is not reachable, please onboard again.", error: nil, viewController: self)
            return
        }

        if splitViewController!.isCollapsed || odataController.dataService == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        collectionSelected(at: indexPath)
    }

    static func entitySet(withName entitySetName: String?) -> EntitySet? {
        switch entitySetName {
        case "SalesOrderHeaders": return MyAppMDKDataMetadata.EntitySets.salesOrderHeaders
        case "Products": return MyAppMDKDataMetadata.EntitySets.products
        case "ProductTexts": return MyAppMDKDataMetadata.EntitySets.productTexts
        case "Customers": return MyAppMDKDataMetadata.EntitySets.customers
        case "Stock": return MyAppMDKDataMetadata.EntitySets.stock
        case "PurchaseOrderHeaders": return MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders
        case "SalesOrderItems": return MyAppMDKDataMetadata.EntitySets.salesOrderItems
        case "ProductCategories": return MyAppMDKDataMetadata.EntitySets.productCategories
        case "PurchaseOrderItems": return MyAppMDKDataMetadata.EntitySets.purchaseOrderItems
        case "Suppliers": return MyAppMDKDataMetadata.EntitySets.suppliers
        default: return nil
        }
    }
}
