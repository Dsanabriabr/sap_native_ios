//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import SAPCommon

public enum OfflineODataControllerError: Error {
    case cannotCreateOfflinePath
    case storeClosed
}

extension OfflineODataControllerError: SAPError {
    public var description: String {
        switch self {
        case .cannotCreateOfflinePath:
            return "OfflineODataControllerError.cannotCreateOfflinePath: Unable to create offline path."
        case .storeClosed:
            return "OfflineODataControllerError.storeClosed: Store is closed."
        }
    }

    public var debugDescription: String {
        return description
    }

    public var errorDescription: String? {
        return description
    }

    public var failureReason: String? {
        return description
    }
}
