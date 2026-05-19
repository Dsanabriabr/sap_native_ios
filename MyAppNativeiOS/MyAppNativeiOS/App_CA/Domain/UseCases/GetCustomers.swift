//
//  GetCustomers.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

final class GetCustomersUseCase {
    private let repository: CustomerRepository

    init(repository: CustomerRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Customer] {
        try await repository.fetchAll()
    }
}
