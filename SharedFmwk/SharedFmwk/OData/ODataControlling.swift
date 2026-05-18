//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import SAPFoundation

public protocol ODataControlling {
    func configureOData(sapURLSession: SAPURLSession, serviceRoot: URL) throws
    func configureOData(sapURLSession: SAPURLSession, serviceRoot: URL, onboardingID: UUID) throws

    func openOfflineStore(synchronize: Bool) async throws
}

public extension ODataControlling {
    func configureOData(sapURLSession _: SAPURLSession, serviceRoot _: URL) throws {
        // OnlineODataController will override this default implementation.
    }

    func configureOData(sapURLSession _: SAPURLSession, serviceRoot _: URL, onboardingID _: UUID) throws {
        // OfflineODataController will override this default implementation.
    }

    func openOfflineStore(synchronize _: Bool) async throws {
        // OfflineODataController will override this default implementation.
    }
}
