//
//  AppContainer.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import SwiftUI

@MainActor
class AppContainer: ObservableObject {

    let repository: CustomerRepository

    init() {
        self.repository = CustomerRepositoryMock()
    }

    func makeCustomerListView() -> some View {
        let useCase = GetCustomersUseCase(repository: repository)
        let vm = CustomerListViewModel(getCustomers: useCase)
        return CustomerListView(viewModel: vm)
    }
    
    func makeCreateCustomerView(customerId: String?) -> some View {
        let get = GetCustomerUseCase(repository: repository)
        let delete = DeleteCustomerUseCase(repository: repository)
        let create = CreateCustomerUseCase(repository: repository)
        let update = UpdateCustomerUseCase(repository: repository)
        let vm = CreateCustomerViewModel(getCustomer: get,
                                         createCustomer: create,
                                         updateCustomer: update,
                                         deleteCustomer: delete,
                                         id: customerId)
        return CreateCustomerView(viewModel: vm)
    }
}
