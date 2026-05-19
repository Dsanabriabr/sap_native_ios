//
//  CreateCustomerView.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import SwiftUI

struct CreateCustomerView: View {

    @StateObject private var viewModel: CreateCustomerViewModel
    @Environment(\.dismiss) private var dismiss

    init(viewModel: CreateCustomerViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Form {
            Section(header: Text("Customer")) {

                TextField("First Name", text: $viewModel.customer.firstName)
                TextField("Last Name", text: $viewModel.customer.lastName)
                TextField("Email", text: Binding(
                    get: { viewModel.customer.email ?? "" },
                    set: { viewModel.customer.email = $0 }
                ))
            }

            Button("Save") {
                Task {
                    try? await viewModel.save()
                    dismiss()
                }
            }

            if viewModel.id != nil {
                Button("Delete", role: .destructive) {
                    Task {
                        try? await viewModel.delete()
                        dismiss()
                    }
                }
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    let repo = CustomerRepositoryMock()
    repo.customers = [Customer(id: "1", firstName: "Daniel", lastName: "Sanabria")]
    let create = CreateCustomerUseCase(repository: repo)
    let update = UpdateCustomerUseCase(repository: repo)
    let delete = DeleteCustomerUseCase(repository: repo)
    let get = GetCustomerUseCase(repository: repo)
    
    let vm = CreateCustomerViewModel(getCustomer: get, createCustomer: create, updateCustomer: update, deleteCustomer: delete, id: "1")
    
    return CreateCustomerView(viewModel: vm)
}
