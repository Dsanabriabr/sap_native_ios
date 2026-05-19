//
//  CustomerRepository.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import MyAppMDKDataFmwk

protocol CustomerRepository {
    func fetchAll() async throws -> [Customer]
    func fetchById(_ id: String) async throws -> Customer?
    func create(_ customer: Customer) async throws
    func update(_ customer: Customer) async throws
    func delete(id: String) async throws
}

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

enum RepositoryError: Error {
    case notFound
}
