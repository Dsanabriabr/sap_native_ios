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

}
