//
//  CustomerListViewModel.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import SwiftUI

@MainActor
class CustomerListViewModel: ObservableObject {

    @Published var customers: [Customer] = []
    @Published var isLoading = false

    private let getCustomers: GetCustomersUseCase

    init(getCustomers: GetCustomersUseCase) {
        self.getCustomers = getCustomers
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            customers = try await getCustomers.execute()
        } catch {
            print(error)
        }
    }
}
