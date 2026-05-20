//
//  SAPServiceProvider.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 19/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import MyAppMDKDataFmwk
import SharedFmwk
import SAPFioriFlows

final class SAPServiceProvider {

    static func makeDataService() -> MyAppMDKData? {
        guard let odataController =
            OnboardingSessionManager.shared
                .onboardingSession?
                .odataControllers[ODataContainerType.myAppMDKData.description]
                as? MyAppMDKDataOfflineODataController
        else {
            return nil
        }
        return odataController.dataService
    }
}
