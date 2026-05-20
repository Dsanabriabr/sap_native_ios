//
//  AppContainer.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import SwiftUI
import MyAppMDKDataFmwk

@MainActor
class AppContainer: ObservableObject {

    let customerRepository: CustomerRepository

    init() {
        guard let dataService = SAPServiceProvider.makeDataService() else {
                fatalError("SAP DataService not available")
            }
        let sapCustomerService = SAPCustomerService(dataService: dataService)
        self.customerRepository = CustomerRepositoryData(service: sapCustomerService)
    }

    func makeCustomerListView() -> some View {
        let useCase = GetCustomersUseCase(repository: customerRepository)
        let vm = CustomerListViewModel(getCustomers: useCase)
        return CustomerListView(viewModel: vm)
    }
    
    func makeCreateCustomerView(customerId: String?) -> some View {
        let get = GetCustomerUseCase(repository: customerRepository)
        let delete = DeleteCustomerUseCase(repository: customerRepository)
        let create = CreateCustomerUseCase(repository: customerRepository)
        let update = UpdateCustomerUseCase(repository: customerRepository)
        let vm = CreateCustomerViewModel(getCustomer: get,
                                         createCustomer: create,
                                         updateCustomer: update,
                                         deleteCustomer: delete,
                                         id: customerId)
        return CreateCustomerView(viewModel: vm)
    }
}
