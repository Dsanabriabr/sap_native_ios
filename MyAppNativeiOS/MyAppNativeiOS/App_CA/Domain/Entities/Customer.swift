//
//  Customer.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import MyAppMDKDataFmwk

struct Address: Equatable {
    var street: String?
    var houseNumber: String?
    var city: String?
    var postalCode: String?
    var country: String?
}

struct Customer: Equatable, Identifiable {
    let id: String
    
    var firstName: String
    var lastName: String
    var email: String?
    var phone: String?
    var address: Address?
}

extension Customer {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
