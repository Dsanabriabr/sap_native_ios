//
//  CustomerMapper.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import MyAppMDKDataFmwk

struct CustomerMapper {

    static func toDomain(_ sap: MyAppMDKDataFmwk.Customer) -> Customer {
        let address = Address(street: sap.street,
                              houseNumber: sap.houseNumber,
                              city: sap.city,
                              postalCode: sap.postalCode,
                              country: sap.country)
        return Customer(
                id: sap.customerID.map { String($0) } ?? "",
                firstName: sap.firstName ?? "",
                lastName: sap.lastName ?? "",
                email: sap.emailAddress,
                phone: sap.phoneNumber,
                address: address
            )
    }

    static func toSAP(_ domain: Customer) -> MyAppMDKDataFmwk.Customer {
        let entity = MyAppMDKDataFmwk.Customer()
        
        if let id = Int64(domain.id) {
            entity.customerID = id
        }
        entity.firstName = domain.firstName
        entity.lastName = domain.lastName
        entity.emailAddress = domain.email
        entity.phoneNumber = domain.phone
        if entity.address == nil {
                entity.address = MyAppMDKDataFmwk.Address()
            }
        entity.address?.street = domain.address?.street
        entity.address?.houseNumber = domain.address?.houseNumber
        entity.address?.city = domain.address?.city
        entity.address?.postalCode = domain.address?.postalCode
        entity.address?.country = domain.address?.country
        
        return entity
    }
}
