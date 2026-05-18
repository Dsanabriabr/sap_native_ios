//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import MyAppMDKDataFmwk
import SAPCommon
import SAPFoundation
import SAPOData
import SAPOfflineOData

public class MyAppMDKDataOfflineODataController: ODataControlling {
    private let logger = Logger.shared(named: "MyAppMDKDataOfflineODataController")
    public var dataService: MyAppMDKData!
    private(set) var isOfflineStoreOpened = false
    private let delegate: OfflineODataProviderDelegate?

    public init(delegate: OfflineODataProviderDelegate? = nil) {
        self.delegate = delegate
    }

    // MARK: - Public methods

    public static func offlineStorePath(for onboardingID: UUID) throws -> URL {
        guard let documentsFolderURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else {
            throw OfflineODataControllerError.cannotCreateOfflinePath
        }
        return documentsFolderURL.appendingPathComponent(onboardingID.uuidString).appendingPathComponent("MyAppMDKData")
    }

    public static func createStore(for onboardingID: UUID) throws -> URL {
        let offlinePath = try offlineStorePath(for: onboardingID)
        try FileManager.default.createDirectory(at: offlinePath, withIntermediateDirectories: true)
        return offlinePath
    }

    public static func removeStore(for onboardingID: UUID) throws {
        let offlinePath = try offlineStorePath(for: onboardingID)
        try OfflineODataProvider.clear(at: offlinePath, withName: nil)
    }

    /// Read more about setting up an application with Offline Store: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/92f0a91d9d3148fd98b86082cf2cb1d5.html
    public func configureOData(sapURLSession: SAPURLSession, serviceRoot: URL, onboardingID: UUID) throws {
        let offlineParameters = OfflineODataParameters()
        offlineParameters.enableRepeatableRequests = true

        // Configure the path of the Offline Store
        offlineParameters.storePath = try MyAppMDKDataOfflineODataController.createStore(for: onboardingID)

        // Setup an instance of delegate. See sample code below for definition of OfflineODataDelegateSample class.
        let offlineODataProvider = try! OfflineODataProvider(serviceRoot: serviceRoot, parameters: offlineParameters, sapURLSession: sapURLSession, delegate: delegate)
        try configureDefiningQueries(on: offlineODataProvider)
        dataService = MyAppMDKData(provider: offlineODataProvider.syncProvider)
    }

    public func openOfflineStore(synchronize: Bool) async throws {
        if !isOfflineStoreOpened {
            // The OfflineODataProvider needs to be opened before performing any operations.
            do {
                try await dataService.open()
            } catch {
                logger.error("Could not open offline store.", error: error)
                throw error
            }
            isOfflineStoreOpened = true
            logger.info("Offline store opened.")
        }
        if synchronize {
            // You might want to consider doing the synchronization based on an explicit user interaction instead of automatically synchronizing during startup
            try await self.synchronize()
        }
    }

    public func closeOfflineStore() async {
        if isOfflineStoreOpened {
            do {
                // the Offline store should be closed when it is no longer used.
                try await dataService.close()
                isOfflineStoreOpened = false
            } catch {
                logger.error("Offline Store closing failed.")
            }
        }
        logger.info("Offline Store closed.")
    }

    /// You can read more about data synchnonization: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/59ae11dc4df345bc8073f9da45170706.html
    public func synchronize() async throws {
        if !isOfflineStoreOpened {
            logger.error("Offline Store is still closed")
            throw OfflineODataControllerError.storeClosed
        }
        try await uploadOfflineStore()
        try await downloadOfflineStore()
    }

    // MARK: - Private methods

    private func downloadOfflineStore() async throws {
        // the download function updates the client’s offline store from the backend.
        do {
            try await dataService.download()
        } catch {
            logger.error("Offline Store download failed", error: error)
            throw error
        }
        logger.info("Offline Store successfully downloaded")
    }

    private func uploadOfflineStore() async throws {
        // the upload function updates the backend from the client’s offline store.
        do {
            try await dataService.upload()
        } catch {
            logger.error("Offline Store upload failed.", error: error)
            throw error
        }
        logger.info("Offline Store successfully uploaded.")
    }

    /// Read more about Defining Queries: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/2235da24931b4be69ad0ada82873044e.html
    private func configureDefiningQueries(on offlineODataProvider: OfflineODataProvider) throws {
        // Although it is not the best practice, we are defining this query limit as top=20.
        // If the service supports paging, then paging should be used instead of top!
        do {
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.salesOrderHeaders.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.salesOrderHeaders).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.products.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.products).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.productTexts.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.productTexts).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.customers.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.customers).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.stock.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.stock).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.salesOrderItems.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.salesOrderItems).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.productCategories.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.productCategories).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.purchaseOrderItems.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.purchaseOrderItems).selectAll(), automaticallyRetrievesStreams: false))
            try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: MyAppMDKDataMetadata.EntitySets.suppliers.localName, query: DataQuery().from(MyAppMDKDataMetadata.EntitySets.suppliers).selectAll(), automaticallyRetrievesStreams: false))
        } catch {
            logger.error("Failed to add defining query for Offline Store initialization", error: error)
            throw error
        }
    }
}
