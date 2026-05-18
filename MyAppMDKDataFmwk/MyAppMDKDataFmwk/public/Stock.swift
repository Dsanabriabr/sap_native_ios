// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class Stock: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let lotSize__lock = ObjectBase()

    private nonisolated(unsafe) static var lotSize_: Property = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "LotSize")

    private nonisolated(unsafe) static let minStock__lock = ObjectBase()

    private nonisolated(unsafe) static var minStock_: Property = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "MinStock")

    private nonisolated(unsafe) static let productID__lock = ObjectBase()

    private nonisolated(unsafe) static var productID_: Property = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "ProductID")

    private nonisolated(unsafe) static let quantity__lock = ObjectBase()

    private nonisolated(unsafe) static var quantity_: Property = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "Quantity")

    private nonisolated(unsafe) static let quantityLessMin__lock = ObjectBase()

    private nonisolated(unsafe) static var quantityLessMin_: Property = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "QuantityLessMin")

    private nonisolated(unsafe) static let product__lock = ObjectBase()

    private nonisolated(unsafe) static var product_: Property = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "Product")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.stock, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [Stock] {
        return ArrayConverter.convert(from.toArray(), [Stock]())
    }

    open func copy() -> Stock {
        return CastRequired<Stock>.from(copyEntity())
    }

    override open var isProxy: Bool {
        return true
    }

    open class func key(productID: Int64?) -> EntityKey {
        return EntityKey().with(name: "ProductID", value: LongValue.of(optional: productID))
    }

    @inline(__always)
    open class var lotSize: Property {
        get {
            objc_sync_enter(lotSize__lock)
            defer { objc_sync_exit(lotSize__lock) }
            do {
                return Stock.lotSize_
            }
        }
        set(value) {
            objc_sync_enter(lotSize__lock)
            defer { objc_sync_exit(lotSize__lock) }
            do {
                Stock.lotSize_ = value
            }
        }
    }

    open var lotSize: Int? {
        get {
            return IntValue.optional(optionalValue(for: Stock.lotSize))
        }
        set(value) {
            setOptionalValue(for: Stock.lotSize, to: IntValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var minStock: Property {
        get {
            objc_sync_enter(minStock__lock)
            defer { objc_sync_exit(minStock__lock) }
            do {
                return Stock.minStock_
            }
        }
        set(value) {
            objc_sync_enter(minStock__lock)
            defer { objc_sync_exit(minStock__lock) }
            do {
                Stock.minStock_ = value
            }
        }
    }

    open var minStock: Int? {
        get {
            return IntValue.optional(optionalValue(for: Stock.minStock))
        }
        set(value) {
            setOptionalValue(for: Stock.minStock, to: IntValue.of(optional: value))
        }
    }

    open var old: Stock {
        return CastRequired<Stock>.from(oldEntity)
    }

    @inline(__always)
    open class var product: Property {
        get {
            objc_sync_enter(product__lock)
            defer { objc_sync_exit(product__lock) }
            do {
                return Stock.product_
            }
        }
        set(value) {
            objc_sync_enter(product__lock)
            defer { objc_sync_exit(product__lock) }
            do {
                Stock.product_ = value
            }
        }
    }

    open var product: Product? {
        get {
            return CastOptional<Product>.from(optionalValue(for: Stock.product))
        }
        set(value) {
            setOptionalValue(for: Stock.product, to: value)
        }
    }

    @inline(__always)
    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return Stock.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                Stock.productID_ = value
            }
        }
    }

    open var productID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: Stock.productID))
        }
        set(value) {
            setOptionalValue(for: Stock.productID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var quantity: Property {
        get {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                return Stock.quantity_
            }
        }
        set(value) {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                Stock.quantity_ = value
            }
        }
    }

    open var quantity: Int? {
        get {
            return IntValue.optional(optionalValue(for: Stock.quantity))
        }
        set(value) {
            setOptionalValue(for: Stock.quantity, to: IntValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var quantityLessMin: Property {
        get {
            objc_sync_enter(quantityLessMin__lock)
            defer { objc_sync_exit(quantityLessMin__lock) }
            do {
                return Stock.quantityLessMin_
            }
        }
        set(value) {
            objc_sync_enter(quantityLessMin__lock)
            defer { objc_sync_exit(quantityLessMin__lock) }
            do {
                Stock.quantityLessMin_ = value
            }
        }
    }

    open var quantityLessMin: Bool? {
        get {
            return BooleanValue.optional(optionalValue(for: Stock.quantityLessMin))
        }
        set(value) {
            setOptionalValue(for: Stock.quantityLessMin, to: BooleanValue.of(optional: value))
        }
    }
}
