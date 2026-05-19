//
//  GetCustomer.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

final class GetCustomerUseCase {
    private let repository: CustomerRepository

    init(repository: CustomerRepository) {
        self.repository = repository
    }

    func execute(id: String) async throws -> Customer? {
        try await repository.fetchById(id)
    }
}
