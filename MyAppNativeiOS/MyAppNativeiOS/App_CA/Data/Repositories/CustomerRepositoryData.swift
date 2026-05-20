//
//  CustomerRepositoryData.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import MyAppMDKDataFmwk

// MARK: DATA
final class CustomerRepositoryData: CustomerRepository {

    private let service: CustomerDataSource

    init(service: CustomerDataSource) {
        self.service = service
    }

    func fetchAll() async throws -> [Customer] {
        let sapCustomers = try await service.fetchCustomers()
        return sapCustomers.map {
            CustomerMapper.toDomain($0)
        }
    }

    func fetchById(_ id: String) async throws -> Customer? {
        let sap = try await service.fetchCustomer(id: id)
        return sap.map { CustomerMapper.toDomain($0) }
    }

    func create(_ customer: Customer) async throws {
        let sap = CustomerMapper.toSAP(customer)
        try await service.create(sap)
    }

    func update(_ customer: Customer) async throws {
        let sap = CustomerMapper.toSAP(customer)
        try await service.update(sap)
    }

    func delete(id: String) async throws {
        try await service.delete(id: id)
    }
}

// MARK: MOCK

final class CustomerRepositoryMock: CustomerRepository {
    
    var customers: [Customer] = []
    
    func fetchAll() async throws -> [Customer] {
        customers
    }
    
    func fetchById(_ id: String) async throws -> Customer? {
        customers.first { $0.id == id }
    }
    
    func create(_ customer: Customer) async throws {
        customers.append(customer)
    }
    
    func update(_ customer: Customer) async throws {
        guard let index = customers.firstIndex(where: { $0.id == customer.id }) else {
                throw RepositoryError.notFound
            }
        customers[index] = customer
    }
    
    func delete(id: String) async throws {
        guard let index = customers.firstIndex(where: { $0.id == id }) else {
                throw RepositoryError.notFound
            }
        customers.remove(at: index)
    }
}
