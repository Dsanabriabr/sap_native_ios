//
//  DeleteCustomer.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

final class DeleteCustomerUseCase {
    private let repository: CustomerRepository

    init(repository: CustomerRepository) {
        self.repository = repository
    }

    func execute(id: String) async throws -> () {
        try await repository.delete(id: id)
    }
}
