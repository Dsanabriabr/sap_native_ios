// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

public class GenderConvert {
    public static func fromOptionalEnumValue(_ value: DataValue?) -> Gender? {
        if value === nil {
            return nil
        } else {
            let var_value = value!
            return GenderConvert.fromRequiredEnumValue(var_value)
        }
    }

    public static func fromRequiredEnumValue(_ value: DataValue) -> Gender {
        let var_value = CastRequired<EnumValue>.from(value)
        return Gender(rawValue: var_value.intValue())!
    }

    public static func toOptionalEnumValue(_ value: Gender?) -> EnumValue? {
        if value == nil {
            return nil
        } else {
            let var_value = value!
            return GenderConvert.toRequiredEnumValue(var_value)
        }
    }

    public static func toRequiredEnumValue(_ value: Gender) -> EnumValue {
        return MyAppMDKDataMetadata.EnumTypes.gender.withInt(value.rawValue)
    }
}
