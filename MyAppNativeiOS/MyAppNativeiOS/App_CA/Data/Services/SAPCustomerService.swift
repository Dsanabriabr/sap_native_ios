//
//  SAPCustomerService.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import MyAppMDKDataFmwk
import SAPOData

final class SAPCustomerService: CustomerDataSource {

    private let dataService: MyAppMDKData
    var loadEntitiesBlock: (() async throws -> [MyAppMDKDataFmwk.Customer])?
    private let entitySetName = "Customers"

    init(dataService: MyAppMDKData) {
        self.dataService = dataService
    }
    
    private var entitySet: EntitySet {
        guard let set = dataService.entitySet(withName: entitySetName) as? EntitySet else {
            fatalError("Invalid EntitySet for name: \(entitySetName)")
        }
        return set
    }

    private func prepare(_ customer: MyAppMDKDataFmwk.Customer) -> EntityValue {
        let set = entitySet
        if set.isLocalDraft {
            _ = customer.asDraft()
        }
        return customer.inSet(set)
    }

    // MARK: - FETCH LIST
    func fetchEntityList() async throws -> [MyAppMDKDataFmwk.Customer] {
        let query = DataQuery().selectAll()
        return try await dataService.fetchCustomers(matching: query)
    }

    // MARK: - FETCH
    func fetchEntity(id: String) async throws -> MyAppMDKDataFmwk.Customer? {
        try await dataService.fetchCustomerWithKey(customerID: Int64(id), query: nil, headers: nil, options: nil)
    }

    // MARK: - CREATE
    func create(_ customer: MyAppMDKDataFmwk.Customer) async throws {
        let prepared = prepare(customer)
        try await dataService.createEntity(prepared)
    }

    // MARK: - UPDATE
    func update(_ customer: MyAppMDKDataFmwk.Customer) async throws {
        let prepared = prepare(customer)
        try await dataService.updateEntity(prepared)
    }

    // MARK: - DELETE
    func delete(id: String) async throws {
        guard let entity = try await fetchEntity(id: id) else {
            throw RepositoryError.notFound
        }
        try await dataService.deleteEntity(entity)
    }

    // MARK: - DRAFT (opcional avançado)
    func activateDraft(_ customer: MyAppMDKDataFmwk.Customer) async throws {
        let draft = customer.withDeepCreate()
        let prepared = draft.inSet(entitySet)
        _ = try await dataService.activateDraft(prepared)
    }
}
