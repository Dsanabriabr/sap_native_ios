// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class ProductText: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let keyID__lock = ObjectBase()

    private nonisolated(unsafe) static var keyID_: Property = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "ID")

    private nonisolated(unsafe) static let language__lock = ObjectBase()

    private nonisolated(unsafe) static var language_: Property = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "Language")

    private nonisolated(unsafe) static let longDescription__lock = ObjectBase()

    private nonisolated(unsafe) static var longDescription_: Property = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "LongDescription")

    private nonisolated(unsafe) static let name__lock = ObjectBase()

    private nonisolated(unsafe) static var name_: Property = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "Name")

    private nonisolated(unsafe) static let productID__lock = ObjectBase()

    private nonisolated(unsafe) static var productID_: Property = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "ProductID")

    private nonisolated(unsafe) static let shortDescription__lock = ObjectBase()

    private nonisolated(unsafe) static var shortDescription_: Property = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "ShortDescription")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.productText, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [ProductText] {
        return ArrayConverter.convert(from.toArray(), [ProductText]())
    }

    open func copy() -> ProductText {
        return CastRequired<ProductText>.from(copyEntity())
    }

    override open var isProxy: Bool {
        return true
    }

    open class func key(id: Int64?) -> EntityKey {
        return EntityKey().with(name: "ID", value: LongValue.of(optional: id))
    }

    @inline(__always)
    open class var keyID: Property {
        get {
            objc_sync_enter(keyID__lock)
            defer { objc_sync_exit(keyID__lock) }
            do {
                return ProductText.keyID_
            }
        }
        set(value) {
            objc_sync_enter(keyID__lock)
            defer { objc_sync_exit(keyID__lock) }
            do {
                ProductText.keyID_ = value
            }
        }
    }

    open var keyID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: ProductText.keyID))
        }
        set(value) {
            setOptionalValue(for: ProductText.keyID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var language: Property {
        get {
            objc_sync_enter(language__lock)
            defer { objc_sync_exit(language__lock) }
            do {
                return ProductText.language_
            }
        }
        set(value) {
            objc_sync_enter(language__lock)
            defer { objc_sync_exit(language__lock) }
            do {
                ProductText.language_ = value
            }
        }
    }

    open var language: String? {
        get {
            return StringValue.optional(optionalValue(for: ProductText.language))
        }
        set(value) {
            setOptionalValue(for: ProductText.language, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var longDescription: Property {
        get {
            objc_sync_enter(longDescription__lock)
            defer { objc_sync_exit(longDescription__lock) }
            do {
                return ProductText.longDescription_
            }
        }
        set(value) {
            objc_sync_enter(longDescription__lock)
            defer { objc_sync_exit(longDescription__lock) }
            do {
                ProductText.longDescription_ = value
            }
        }
    }

    open var longDescription: String? {
        get {
            return StringValue.optional(optionalValue(for: ProductText.longDescription))
        }
        set(value) {
            setOptionalValue(for: ProductText.longDescription, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var name: Property {
        get {
            objc_sync_enter(name__lock)
            defer { objc_sync_exit(name__lock) }
            do {
                return ProductText.name_
            }
        }
        set(value) {
            objc_sync_enter(name__lock)
            defer { objc_sync_exit(name__lock) }
            do {
                ProductText.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(optionalValue(for: ProductText.name))
        }
        set(value) {
            setOptionalValue(for: ProductText.name, to: StringValue.of(optional: value))
        }
    }

    open var old: ProductText {
        return CastRequired<ProductText>.from(oldEntity)
    }

    @inline(__always)
    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return ProductText.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                ProductText.productID_ = value
            }
        }
    }

    open var productID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: ProductText.productID))
        }
        set(value) {
            setOptionalValue(for: ProductText.productID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var shortDescription: Property {
        get {
            objc_sync_enter(shortDescription__lock)
            defer { objc_sync_exit(shortDescription__lock) }
            do {
                return ProductText.shortDescription_
            }
        }
        set(value) {
            objc_sync_enter(shortDescription__lock)
            defer { objc_sync_exit(shortDescription__lock) }
            do {
                ProductText.shortDescription_ = value
            }
        }
    }

    open var shortDescription: String? {
        get {
            return StringValue.optional(optionalValue(for: ProductText.shortDescription))
        }
        set(value) {
            setOptionalValue(for: ProductText.shortDescription, to: StringValue.of(optional: value))
        }
    }
}
