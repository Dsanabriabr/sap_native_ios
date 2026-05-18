//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import Foundation

public enum ODataContainerType: CaseIterable {
    case myAppMDKData
    case none

    public init?(rawValue: String) {
        guard let type = ODataContainerType.allCases.first(where: { rawValue == $0.description }) else {
            return nil
        }
        self = type
    }

    public var description: String {
        switch self {
        case .myAppMDKData: return "MyAppMDKData"
        case .none: return ""
        }
    }
}
