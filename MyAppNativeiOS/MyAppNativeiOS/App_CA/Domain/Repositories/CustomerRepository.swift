//
//  CustomerRepository.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import MyAppMDKDataFmwk

protocol CustomerRepository {
    func fetchAll() async throws -> [Customer]
    func fetchById(_ id: String) async throws -> Customer?
    func create(_ customer: Customer) async throws
    func update(_ customer: Customer) async throws
    func delete(id: String) async throws
}
