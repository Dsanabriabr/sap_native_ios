//
//  UpdateCustomer.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

final class UpdateCustomerUseCase {
    private let repository: CustomerRepository

    init(repository: CustomerRepository) {
        self.repository = repository
    }

    func execute(customer: Customer) async throws -> () {
        try await repository.update(customer)
    }
}
