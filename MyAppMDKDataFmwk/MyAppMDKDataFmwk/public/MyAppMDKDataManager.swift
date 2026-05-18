// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

public class MyAppMDKDataManager: @unchecked Sendable {
    private nonisolated(unsafe) static var service_: MyAppMDKData!

    public static var service: MyAppMDKData {
        get {
            objc_sync_enter(MyAppMDKDataManager.self)
            defer { objc_sync_exit(MyAppMDKDataManager.self) }
            do {
                return CheckProperty.isDefined(MyAppMDKDataManager.self, "service (static)", MyAppMDKDataManager.service_)
            }
        }
        set(value) {
            objc_sync_enter(MyAppMDKDataManager.self)
            defer { objc_sync_exit(MyAppMDKDataManager.self) }
            do {
                MyAppMDKDataManager.service_ = value
            }
        }
    }
}
