//
//  CreateCustomerViewModel.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import SwiftUI

@MainActor
class CreateCustomerViewModel: ObservableObject {
    @Published var customer: Customer
    @Published var isLoading = false
    @Published var id: String?

    private let getCustomer: GetCustomerUseCase
    private let createCustomer: CreateCustomerUseCase
    private let updateCustomer: UpdateCustomerUseCase
    private let deleteCustomer: DeleteCustomerUseCase

    init(
        getCustomer: GetCustomerUseCase,
        createCustomer: CreateCustomerUseCase,
        updateCustomer: UpdateCustomerUseCase,
        deleteCustomer: DeleteCustomerUseCase,
        id: String?
    ) {
        self.getCustomer = getCustomer
        self.createCustomer = createCustomer
        self.updateCustomer = updateCustomer
        self.deleteCustomer = deleteCustomer
        self.id = id
        self.customer = Customer(id: "", firstName: "", lastName: "")
    }

    func load() async {
        guard let id = id else { return }
        isLoading = true
        defer { isLoading = false }
        do {
            if let fetched = try await getCustomer.execute(id: id) {
                customer = fetched
            }
        } catch {
            print(error)
        }
    }

    func save() async throws {
        if id == nil {
            try await createCustomer.execute(customer: customer)
        } else {
            try await updateCustomer.execute(customer: customer)
        }
    }

    func delete() async throws {
        guard let id = id else { return }
        try await deleteCustomer.execute(id: id)
    }

}
