//
//  CustomerDataSource.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 20/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import MyAppMDKDataFmwk

protocol CustomerDataSource {
    func fetchEntityList() async throws -> [MyAppMDKDataFmwk.Customer]
    func fetchEntity(id: String) async throws -> MyAppMDKDataFmwk.Customer?
    func create(_ customer: MyAppMDKDataFmwk.Customer) async throws
    func update(_ customer: MyAppMDKDataFmwk.Customer) async throws
    func delete(id: String) async throws
    func activateDraft(_ customer: MyAppMDKDataFmwk.Customer) async throws
}
