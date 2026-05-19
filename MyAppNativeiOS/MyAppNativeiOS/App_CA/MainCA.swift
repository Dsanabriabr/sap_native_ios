//
//  MainCA.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import SwiftUI

struct MainCA: View {
    @StateObject var app = AppContainer()
    var body: some View {
        app.makeCustomerListView()
            .environmentObject(app)
    }
}
