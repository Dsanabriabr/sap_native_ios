//
//  CATests.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//


import XCTest
@testable import MyAppNativeiOS

final class CustomerTests: XCTestCase {

    func testCustomerFullName() {

        let customer = Customer(
            id: "1",
            firstName: "Daniel",
            lastName: "Sanabria",
            email: nil,
            phone: nil,
            address: nil
        )

        XCTAssertEqual(customer.fullName, "Daniel Sanabria")
    }

    func testGetCustomers() async throws {
        let repo = CustomerRepositoryMock()
        repo.customers = [
            Customer(id: "1", firstName: "Daniel", lastName: "Sanabria", email: nil, phone: nil, address: nil)
        ]
        let useCase = GetCustomersUseCase(repository: repo)
        let result = try await useCase.execute()

        XCTAssertEqual(result.count, 1)
    }
    
    func testGetCustomer() async throws {
        let repo = CustomerRepositoryMock()
        repo.customers = [
            Customer(id: "1", firstName: "Daniel", lastName: "Sanabria", email: nil, phone: nil, address: nil)
        ]
        let useCase = GetCustomerUseCase(repository: repo)
        let result = try await useCase.execute(id: "1")

        XCTAssertEqual(result?.firstName, "Daniel")
    }
    
    func testCreateCustomer() async throws {
        let repo = CustomerRepositoryMock()
        let useCase = CreateCustomerUseCase(repository: repo)
        let customer = Customer(
                id: "1",
                firstName: "Daniel",
                lastName: "Sanabria",
                email: nil,
                phone: nil,
                address: nil
            )
            try await useCase.execute(customer: customer)

        XCTAssertEqual(repo.customers.first?.firstName, "Daniel")
    }
    
    func testDeleteCustomer() async throws {
        let repo = CustomerRepositoryMock()
        repo.customers = [
            Customer(id: "1", firstName: "Daniel", lastName: "Sanabria", email: nil, phone: nil, address: nil)
        ]
        let useCase = DeleteCustomerUseCase(repository: repo)
        try await useCase.execute(id: "1")

        XCTAssertEqual(repo.customers.isEmpty, true)
    }
    
    func testUpdateCustomer() async throws {
        let repo = CustomerRepositoryMock()
        repo.customers = [
            Customer(id: "1", firstName: "Daniel", lastName: "Sanabria", email: nil, phone: nil, address: nil)
        ]
        let useCase = UpdateCustomerUseCase(repository: repo)
        let customer = Customer(
                id: "1",
                firstName: "Daniel",
                lastName: "Soliz",
                email: nil,
                phone: nil,
                address: nil
            )
        try await useCase.execute(customer: customer)

        XCTAssertEqual(customer.fullName, "Daniel Soliz")
    }
    
    @MainActor
    func testModel_Load_CustomerList() async throws {
        let repo = CustomerRepositoryMock()
        repo.customers = [
            Customer(id: "1", firstName: "Daniel", lastName: "Sanabria", email: nil, phone: nil, address: nil)
        ]

        let useCase = GetCustomersUseCase(repository: repo)
        let vm = CustomerListViewModel(getCustomers: useCase)

        await vm.load()

        XCTAssertEqual(vm.customers.count, 1)
    }
    
    @MainActor
    func testModel_Save_CreateCustomer() async throws {
        let repo = CustomerRepositoryMock()
        let create = CreateCustomerUseCase(repository: repo)
        let update = UpdateCustomerUseCase(repository: repo)
        let delete = DeleteCustomerUseCase(repository: repo)
        let get = GetCustomerUseCase(repository: repo)

        let vm = CreateCustomerViewModel(
            getCustomer: get,
            createCustomer: create,
            updateCustomer: update,
            deleteCustomer: delete,
            id: nil
        )

        vm.customer = Customer(id: "1", firstName: "Daniel", lastName: "Sanabria")
        try await vm.save()
        XCTAssertEqual(repo.customers.count, 1)
    }
}
