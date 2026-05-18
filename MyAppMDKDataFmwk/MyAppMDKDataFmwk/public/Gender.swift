// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

public enum Gender: Int, @unchecked Sendable {
    /// Male.
    case male = 0
    /// Female.
    case female = 1
    /// Other.
    case other = 2
    /// None.
    case none = 3
    /// Unknown.
    case unknown = 4

    public var enumValue: EnumValue {
        return GenderConvert.toRequiredEnumValue(self)
    }
}
