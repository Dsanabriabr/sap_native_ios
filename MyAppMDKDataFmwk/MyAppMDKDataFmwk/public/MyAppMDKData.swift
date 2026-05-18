// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class MyAppMDKData: OfflineDataServiceAsync, @unchecked Sendable {
    private var _online: MyAppMDKData?

    private nonisolated(unsafe) static let customers__lock = ObjectBase()

    private nonisolated(unsafe) static var customers_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "Customers")

    private nonisolated(unsafe) static let productCategories__lock = ObjectBase()

    private nonisolated(unsafe) static var productCategories_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "ProductCategories")

    private nonisolated(unsafe) static let productTexts__lock = ObjectBase()

    private nonisolated(unsafe) static var productTexts_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "ProductTexts")

    private nonisolated(unsafe) static let products__lock = ObjectBase()

    private nonisolated(unsafe) static var products_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "Products")

    private nonisolated(unsafe) static let purchaseOrderHeaders__lock = ObjectBase()

    private nonisolated(unsafe) static var purchaseOrderHeaders_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "PurchaseOrderHeaders")

    private nonisolated(unsafe) static let purchaseOrderItems__lock = ObjectBase()

    private nonisolated(unsafe) static var purchaseOrderItems_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "PurchaseOrderItems")

    private nonisolated(unsafe) static let salesOrderHeaders__lock = ObjectBase()

    private nonisolated(unsafe) static var salesOrderHeaders_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "SalesOrderHeaders")

    private nonisolated(unsafe) static let salesOrderItems__lock = ObjectBase()

    private nonisolated(unsafe) static var salesOrderItems_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "SalesOrderItems")

    private nonisolated(unsafe) static let stock__lock = ObjectBase()

    private nonisolated(unsafe) static var stock_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "Stock")

    private nonisolated(unsafe) static let suppliers__lock = ObjectBase()

    private nonisolated(unsafe) static var suppliers_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "Suppliers")

    override public init(provider: DataSyncProvider) {
        super.init(provider: provider)
        provider.metadata = MyAppMDKDataMetadata.document
        ProxyInternal.setCsdlFetcher(provider: provider, fetcher: nil)
        ProxyInternal.setCsdlOptions(provider: provider, options: MyAppMDKDataMetadataParser.options)
        ProxyInternal.setMergeAction(provider: provider, action: { MyAppMDKDataMetadataChanges.merge(metadata: provider.metadata) })
        if !ProxyInternal.isOnlineSetupActive(provider: provider) {
            ProxyInternal.onlineSetupStarting(provider: provider)
            let companion = MyAppMDKData(provider: provider)
            ProxyInternal.enableOnlineMode(service: companion)
            _online = companion
            ProxyInternal.onlineSetupFinished(provider: provider)
        }
    }

    @inline(__always)
    open class var customers: EntitySet {
        get {
            objc_sync_enter(customers__lock)
            defer { objc_sync_exit(customers__lock) }
            do {
                return MyAppMDKData.customers_
            }
        }
        set(value) {
            objc_sync_enter(customers__lock)
            defer { objc_sync_exit(customers__lock) }
            do {
                MyAppMDKData.customers_ = value
            }
        }
    }

    private func fetchCustomer(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Customer {
        return try CastRequired<Customer>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.customers), headers: headers, options: options).requiredEntity())
    }

    open func fetchCustomer(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Customer {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Customer, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchCustomer(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchCustomerWithKey(customerID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Customer {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchCustomer(matching: var_query.withKey(Customer.key(customerID: customerID)), headers: headers, options: options)
    }

    open func fetchCustomerWithKey(customerID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Customer {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Customer, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchCustomerWithKey(customerID: customerID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchCustomers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [Customer] {
        let var_query = DataQuery.newIfNull(query: query)
        return try Customer.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.customers), headers: headers, options: options).entityList())
    }

    open func fetchCustomers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [Customer] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[Customer], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchCustomers(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProduct(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Product {
        return try CastRequired<Product>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.products), headers: headers, options: options).requiredEntity())
    }

    open func fetchProduct(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Product {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Product, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProduct(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProductCategories(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [ProductCategory] {
        let var_query = DataQuery.newIfNull(query: query)
        return try ProductCategory.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.productCategories), headers: headers, options: options).entityList())
    }

    open func fetchProductCategories(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [ProductCategory] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[ProductCategory], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProductCategories(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProductCategory(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductCategory {
        return try CastRequired<ProductCategory>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.productCategories), headers: headers, options: options).requiredEntity())
    }

    open func fetchProductCategory(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> ProductCategory {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<ProductCategory, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProductCategory(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProductCategoryWithKey(category: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductCategory {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchProductCategory(matching: var_query.withKey(ProductCategory.key(category: category)), headers: headers, options: options)
    }

    open func fetchProductCategoryWithKey(category: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> ProductCategory {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<ProductCategory, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProductCategoryWithKey(category: category, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProductText(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductText {
        return try CastRequired<ProductText>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.productTexts), headers: headers, options: options).requiredEntity())
    }

    open func fetchProductText(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> ProductText {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<ProductText, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProductText(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProductTextWithKey(keyID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductText {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchProductText(matching: var_query.withKey(ProductText.key(id: keyID)), headers: headers, options: options)
    }

    open func fetchProductTextWithKey(keyID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> ProductText {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<ProductText, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProductTextWithKey(keyID: keyID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProductTexts(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [ProductText] {
        let var_query = DataQuery.newIfNull(query: query)
        return try ProductText.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.productTexts), headers: headers, options: options).entityList())
    }

    open func fetchProductTexts(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [ProductText] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[ProductText], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProductTexts(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProductWithKey(productID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Product {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchProduct(matching: var_query.withKey(Product.key(productID: productID)), headers: headers, options: options)
    }

    open func fetchProductWithKey(productID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Product {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Product, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProductWithKey(productID: productID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchProducts(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [Product] {
        let var_query = DataQuery.newIfNull(query: query)
        return try Product.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.products), headers: headers, options: options).entityList())
    }

    open func fetchProducts(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [Product] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[Product], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchProducts(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchPurchaseOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderHeader {
        return try CastRequired<PurchaseOrderHeader>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders), headers: headers, options: options).requiredEntity())
    }

    open func fetchPurchaseOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> PurchaseOrderHeader {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<PurchaseOrderHeader, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchPurchaseOrderHeader(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchPurchaseOrderHeaderWithKey(purchaseOrderID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderHeader {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchPurchaseOrderHeader(matching: var_query.withKey(PurchaseOrderHeader.key(purchaseOrderID: purchaseOrderID)), headers: headers, options: options)
    }

    open func fetchPurchaseOrderHeaderWithKey(purchaseOrderID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> PurchaseOrderHeader {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<PurchaseOrderHeader, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchPurchaseOrderHeaderWithKey(purchaseOrderID: purchaseOrderID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchPurchaseOrderHeaders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [PurchaseOrderHeader] {
        let var_query = DataQuery.newIfNull(query: query)
        return try PurchaseOrderHeader.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders), headers: headers, options: options).entityList())
    }

    open func fetchPurchaseOrderHeaders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [PurchaseOrderHeader] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[PurchaseOrderHeader], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchPurchaseOrderHeaders(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchPurchaseOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderItem {
        return try CastRequired<PurchaseOrderItem>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.purchaseOrderItems), headers: headers, options: options).requiredEntity())
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> PurchaseOrderItem {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<PurchaseOrderItem, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchPurchaseOrderItem(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchPurchaseOrderItemWithKey(itemNumber: Int?, purchaseOrderID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderItem {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchPurchaseOrderItem(matching: var_query.withKey(PurchaseOrderItem.key(itemNumber: itemNumber, purchaseOrderID: purchaseOrderID)), headers: headers, options: options)
    }

    open func fetchPurchaseOrderItemWithKey(itemNumber: Int?, purchaseOrderID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> PurchaseOrderItem {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<PurchaseOrderItem, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchPurchaseOrderItemWithKey(itemNumber: itemNumber, purchaseOrderID: purchaseOrderID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchPurchaseOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [PurchaseOrderItem] {
        let var_query = DataQuery.newIfNull(query: query)
        return try PurchaseOrderItem.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.purchaseOrderItems), headers: headers, options: options).entityList())
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [PurchaseOrderItem] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[PurchaseOrderItem], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchPurchaseOrderItems(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSalesOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderHeader {
        return try CastRequired<SalesOrderHeader>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.salesOrderHeaders), headers: headers, options: options).requiredEntity())
    }

    open func fetchSalesOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> SalesOrderHeader {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<SalesOrderHeader, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSalesOrderHeader(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSalesOrderHeaderWithKey(salesOrderID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderHeader {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchSalesOrderHeader(matching: var_query.withKey(SalesOrderHeader.key(salesOrderID: salesOrderID)), headers: headers, options: options)
    }

    open func fetchSalesOrderHeaderWithKey(salesOrderID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> SalesOrderHeader {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<SalesOrderHeader, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSalesOrderHeaderWithKey(salesOrderID: salesOrderID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSalesOrderHeaders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [SalesOrderHeader] {
        let var_query = DataQuery.newIfNull(query: query)
        return try SalesOrderHeader.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.salesOrderHeaders), headers: headers, options: options).entityList())
    }

    open func fetchSalesOrderHeaders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [SalesOrderHeader] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[SalesOrderHeader], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSalesOrderHeaders(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSalesOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderItem {
        return try CastRequired<SalesOrderItem>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.salesOrderItems), headers: headers, options: options).requiredEntity())
    }

    open func fetchSalesOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> SalesOrderItem {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<SalesOrderItem, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSalesOrderItem(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSalesOrderItemWithKey(itemNumber: Int?, salesOrderID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderItem {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchSalesOrderItem(matching: var_query.withKey(SalesOrderItem.key(itemNumber: itemNumber, salesOrderID: salesOrderID)), headers: headers, options: options)
    }

    open func fetchSalesOrderItemWithKey(itemNumber: Int?, salesOrderID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> SalesOrderItem {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<SalesOrderItem, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSalesOrderItemWithKey(itemNumber: itemNumber, salesOrderID: salesOrderID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSalesOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [SalesOrderItem] {
        let var_query = DataQuery.newIfNull(query: query)
        return try SalesOrderItem.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.salesOrderItems), headers: headers, options: options).entityList())
    }

    open func fetchSalesOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [SalesOrderItem] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[SalesOrderItem], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSalesOrderItems(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchStock(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [Stock] {
        let var_query = DataQuery.newIfNull(query: query)
        return try Stock.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.stock), headers: headers, options: options).entityList())
    }

    open func fetchStock(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [Stock] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[Stock], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchStock(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchStock1(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Stock {
        return try CastRequired<Stock>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.stock), headers: headers, options: options).requiredEntity())
    }

    open func fetchStock1(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Stock {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Stock, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchStock1(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchStock1WithKey(productID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Stock {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchStock1(matching: var_query.withKey(Stock.key(productID: productID)), headers: headers, options: options)
    }

    open func fetchStock1WithKey(productID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Stock {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Stock, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchStock1WithKey(productID: productID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSupplier(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Supplier {
        return try CastRequired<Supplier>.from(ProxyInternal.executeQuery(service: self, query: query.fromDefault(MyAppMDKDataMetadata.EntitySets.suppliers), headers: headers, options: options).requiredEntity())
    }

    open func fetchSupplier(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Supplier {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Supplier, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSupplier(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSupplierWithKey(supplierID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Supplier {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchSupplier(matching: var_query.withKey(Supplier.key(supplierID: supplierID)), headers: headers, options: options)
    }

    open func fetchSupplierWithKey(supplierID: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Supplier {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Supplier, Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSupplierWithKey(supplierID: supplierID, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchSuppliers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [Supplier] {
        let var_query = DataQuery.newIfNull(query: query)
        return try Supplier.array(from: ProxyInternal.executeQuery(service: self, query: var_query.fromDefault(MyAppMDKDataMetadata.EntitySets.suppliers), headers: headers, options: options).entityList())
    }

    open func fetchSuppliers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> [Supplier] {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<[Supplier], Error>) in
            asyncFunction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.fetchSuppliers(matching: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func generateSamplePurchaseOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query = DataQuery.newIfNull(query: query)
        return try BooleanValue.unwrap(ProxyInternal.executeQuery(service: self, query: var_query.invoke(MyAppMDKDataMetadata.ActionImports.generateSamplePurchaseOrders, ParameterList.empty), headers: headers, options: options).checkedResult())
    }

    open func generateSamplePurchaseOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Bool {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Bool, Error>) in
            asyncAction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.generateSamplePurchaseOrders(query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func generateSampleSalesOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query = DataQuery.newIfNull(query: query)
        return try BooleanValue.unwrap(ProxyInternal.executeQuery(service: self, query: var_query.invoke(MyAppMDKDataMetadata.ActionImports.generateSampleSalesOrders, ParameterList.empty), headers: headers, options: options).checkedResult())
    }

    open func generateSampleSalesOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Bool {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Bool, Error>) in
            asyncAction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.generateSampleSalesOrders(query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    override open var metadataLock: MetadataLock {
        return MyAppMDKDataMetadata.lock
    }

    open var online: MyAppMDKData {
        let companion = _online
        if companion !== nil {
            return companion!
        } else {
            return self
        }
    }

    @inline(__always)
    open class var productCategories: EntitySet {
        get {
            objc_sync_enter(productCategories__lock)
            defer { objc_sync_exit(productCategories__lock) }
            do {
                return MyAppMDKData.productCategories_
            }
        }
        set(value) {
            objc_sync_enter(productCategories__lock)
            defer { objc_sync_exit(productCategories__lock) }
            do {
                MyAppMDKData.productCategories_ = value
            }
        }
    }

    @inline(__always)
    open class var productTexts: EntitySet {
        get {
            objc_sync_enter(productTexts__lock)
            defer { objc_sync_exit(productTexts__lock) }
            do {
                return MyAppMDKData.productTexts_
            }
        }
        set(value) {
            objc_sync_enter(productTexts__lock)
            defer { objc_sync_exit(productTexts__lock) }
            do {
                MyAppMDKData.productTexts_ = value
            }
        }
    }

    @inline(__always)
    open class var products: EntitySet {
        get {
            objc_sync_enter(products__lock)
            defer { objc_sync_exit(products__lock) }
            do {
                return MyAppMDKData.products_
            }
        }
        set(value) {
            objc_sync_enter(products__lock)
            defer { objc_sync_exit(products__lock) }
            do {
                MyAppMDKData.products_ = value
            }
        }
    }

    @inline(__always)
    open class var purchaseOrderHeaders: EntitySet {
        get {
            objc_sync_enter(purchaseOrderHeaders__lock)
            defer { objc_sync_exit(purchaseOrderHeaders__lock) }
            do {
                return MyAppMDKData.purchaseOrderHeaders_
            }
        }
        set(value) {
            objc_sync_enter(purchaseOrderHeaders__lock)
            defer { objc_sync_exit(purchaseOrderHeaders__lock) }
            do {
                MyAppMDKData.purchaseOrderHeaders_ = value
            }
        }
    }

    @inline(__always)
    open class var purchaseOrderItems: EntitySet {
        get {
            objc_sync_enter(purchaseOrderItems__lock)
            defer { objc_sync_exit(purchaseOrderItems__lock) }
            do {
                return MyAppMDKData.purchaseOrderItems_
            }
        }
        set(value) {
            objc_sync_enter(purchaseOrderItems__lock)
            defer { objc_sync_exit(purchaseOrderItems__lock) }
            do {
                MyAppMDKData.purchaseOrderItems_ = value
            }
        }
    }

    private func resetSampleData(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query = DataQuery.newIfNull(query: query)
        return try BooleanValue.unwrap(ProxyInternal.executeQuery(service: self, query: var_query.invoke(MyAppMDKDataMetadata.ActionImports.resetSampleData, ParameterList.empty), headers: headers, options: options).checkedResult())
    }

    open func resetSampleData(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Bool {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Bool, Error>) in
            asyncAction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.resetSampleData(query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    @inline(__always)
    open class var salesOrderHeaders: EntitySet {
        get {
            objc_sync_enter(salesOrderHeaders__lock)
            defer { objc_sync_exit(salesOrderHeaders__lock) }
            do {
                return MyAppMDKData.salesOrderHeaders_
            }
        }
        set(value) {
            objc_sync_enter(salesOrderHeaders__lock)
            defer { objc_sync_exit(salesOrderHeaders__lock) }
            do {
                MyAppMDKData.salesOrderHeaders_ = value
            }
        }
    }

    @inline(__always)
    open class var salesOrderItems: EntitySet {
        get {
            objc_sync_enter(salesOrderItems__lock)
            defer { objc_sync_exit(salesOrderItems__lock) }
            do {
                return MyAppMDKData.salesOrderItems_
            }
        }
        set(value) {
            objc_sync_enter(salesOrderItems__lock)
            defer { objc_sync_exit(salesOrderItems__lock) }
            do {
                MyAppMDKData.salesOrderItems_ = value
            }
        }
    }

    @inline(__always)
    open class var stock: EntitySet {
        get {
            objc_sync_enter(stock__lock)
            defer { objc_sync_exit(stock__lock) }
            do {
                return MyAppMDKData.stock_
            }
        }
        set(value) {
            objc_sync_enter(stock__lock)
            defer { objc_sync_exit(stock__lock) }
            do {
                MyAppMDKData.stock_ = value
            }
        }
    }

    @inline(__always)
    open class var suppliers: EntitySet {
        get {
            objc_sync_enter(suppliers__lock)
            defer { objc_sync_exit(suppliers__lock) }
            do {
                return MyAppMDKData.suppliers_
            }
        }
        set(value) {
            objc_sync_enter(suppliers__lock)
            defer { objc_sync_exit(suppliers__lock) }
            do {
                MyAppMDKData.suppliers_ = value
            }
        }
    }

    private func updateSalesOrderStatus(id: Int64, newStatus: String, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query = DataQuery.newIfNull(query: query)
        return try BooleanValue.unwrap(ProxyInternal.executeQuery(service: self, query: var_query.invoke(MyAppMDKDataMetadata.ActionImports.updateSalesOrderStatus, ParameterList(capacity: 2 as Int).with(name: "id", value: LongValue.of(id)).with(name: "newStatus", value: StringValue.of(newStatus))), headers: headers, options: options).checkedResult())
    }

    open func updateSalesOrderStatus(id: Int64, newStatus: String, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) async throws -> Bool {
        return try await withUnsafeThrowingContinuation {
            (continuation: UnsafeContinuation<Bool, Error>) in
            asyncAction {
                do {
                    try self.checkIfCancelled(options?.cancelToken)
                    let result = try self.updateSalesOrderStatus(id: id, newStatus: newStatus, query: query, headers: headers, options: options)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
