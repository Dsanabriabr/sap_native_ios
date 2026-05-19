//
//  CustomerListView.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import SwiftUI

struct CustomerListView: View {
    
    @EnvironmentObject var app: AppContainer
    @StateObject private var viewModel: CustomerListViewModel
    
    init(viewModel: CustomerListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationStack {
            List(viewModel.customers) { customer in
                NavigationLink {
                    app.makeCreateCustomerView(customerId: customer.id)
                } label: {
                    VStack(alignment: .leading) {
                        Text(customer.fullName)
                        Text(customer.email ?? "")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Customers")
            .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            presentingModal = true
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                .sheet(isPresented: $presentingModal, onDismiss: {
                    Task {
                        await viewModel.load()
                    }
                }) {
                    app.makeCreateCustomerView(customerId: nil)
                }
            .onAppear {
                Task {
                    await viewModel.load()
                }
            }
        }
    }
    @State var presentingModal = false
}

#Preview {
    let repo = CustomerRepositoryMock()
        repo.customers = [
            Customer(id: "1", firstName: "Daniel", lastName: "Sanabria", email: "daniel@email.com", phone: nil, address: nil)
        ]
        let useCase = GetCustomersUseCase(repository: repo)
        let vm = CustomerListViewModel(getCustomers: useCase)

        vm.customers = repo.customers
        return CustomerListView(viewModel: vm)
}
