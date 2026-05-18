// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class PurchaseOrderItem: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let currencyCode__lock = ObjectBase()

    private nonisolated(unsafe) static var currencyCode_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "CurrencyCode")

    private nonisolated(unsafe) static let grossAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var grossAmount_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmount")

    private nonisolated(unsafe) static let itemNumber__lock = ObjectBase()

    private nonisolated(unsafe) static var itemNumber_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "ItemNumber")

    private nonisolated(unsafe) static let netAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var netAmount_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "NetAmount")

    private nonisolated(unsafe) static let productID__lock = ObjectBase()

    private nonisolated(unsafe) static var productID_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductID")

    private nonisolated(unsafe) static let purchaseOrderID__lock = ObjectBase()

    private nonisolated(unsafe) static var purchaseOrderID_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "PurchaseOrderID")

    private nonisolated(unsafe) static let quantity__lock = ObjectBase()

    private nonisolated(unsafe) static var quantity_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "Quantity")

    private nonisolated(unsafe) static let quantityUnit__lock = ObjectBase()

    private nonisolated(unsafe) static var quantityUnit_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "QuantityUnit")

    private nonisolated(unsafe) static let taxAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var taxAmount_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "TaxAmount")

    private nonisolated(unsafe) static let product__lock = ObjectBase()

    private nonisolated(unsafe) static var product_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "Product")

    private nonisolated(unsafe) static let header__lock = ObjectBase()

    private nonisolated(unsafe) static var header_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "Header")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [PurchaseOrderItem] {
        return ArrayConverter.convert(from.toArray(), [PurchaseOrderItem]())
    }

    open func copy() -> PurchaseOrderItem {
        return CastRequired<PurchaseOrderItem>.from(copyEntity())
    }

    @inline(__always)
    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return PurchaseOrderItem.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                PurchaseOrderItem.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(optionalValue(for: PurchaseOrderItem.currencyCode))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.currencyCode, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var grossAmount: Property {
        get {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                return PurchaseOrderItem.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                PurchaseOrderItem.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: PurchaseOrderItem.grossAmount))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var header: Property {
        get {
            objc_sync_enter(header__lock)
            defer { objc_sync_exit(header__lock) }
            do {
                return PurchaseOrderItem.header_
            }
        }
        set(value) {
            objc_sync_enter(header__lock)
            defer { objc_sync_exit(header__lock) }
            do {
                PurchaseOrderItem.header_ = value
            }
        }
    }

    open var header: PurchaseOrderHeader? {
        get {
            return CastOptional<PurchaseOrderHeader>.from(optionalValue(for: PurchaseOrderItem.header))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.header, to: value)
        }
    }

    override open var isProxy: Bool {
        return true
    }

    @inline(__always)
    open class var itemNumber: Property {
        get {
            objc_sync_enter(itemNumber__lock)
            defer { objc_sync_exit(itemNumber__lock) }
            do {
                return PurchaseOrderItem.itemNumber_
            }
        }
        set(value) {
            objc_sync_enter(itemNumber__lock)
            defer { objc_sync_exit(itemNumber__lock) }
            do {
                PurchaseOrderItem.itemNumber_ = value
            }
        }
    }

    open var itemNumber: Int? {
        get {
            return IntValue.optional(optionalValue(for: PurchaseOrderItem.itemNumber))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.itemNumber, to: IntValue.of(optional: value))
        }
    }

    open class func key(itemNumber: Int?, purchaseOrderID: Int64?) -> EntityKey {
        return EntityKey().with(name: "ItemNumber", value: IntValue.of(optional: itemNumber)).with(name: "PurchaseOrderID", value: LongValue.of(optional: purchaseOrderID))
    }

    @inline(__always)
    open class var netAmount: Property {
        get {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                return PurchaseOrderItem.netAmount_
            }
        }
        set(value) {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                PurchaseOrderItem.netAmount_ = value
            }
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: PurchaseOrderItem.netAmount))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: PurchaseOrderItem {
        return CastRequired<PurchaseOrderItem>.from(oldEntity)
    }

    @inline(__always)
    open class var product: Property {
        get {
            objc_sync_enter(product__lock)
            defer { objc_sync_exit(product__lock) }
            do {
                return PurchaseOrderItem.product_
            }
        }
        set(value) {
            objc_sync_enter(product__lock)
            defer { objc_sync_exit(product__lock) }
            do {
                PurchaseOrderItem.product_ = value
            }
        }
    }

    open var product: Product? {
        get {
            return CastOptional<Product>.from(optionalValue(for: PurchaseOrderItem.product))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.product, to: value)
        }
    }

    @inline(__always)
    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return PurchaseOrderItem.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                PurchaseOrderItem.productID_ = value
            }
        }
    }

    open var productID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: PurchaseOrderItem.productID))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.productID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var purchaseOrderID: Property {
        get {
            objc_sync_enter(purchaseOrderID__lock)
            defer { objc_sync_exit(purchaseOrderID__lock) }
            do {
                return PurchaseOrderItem.purchaseOrderID_
            }
        }
        set(value) {
            objc_sync_enter(purchaseOrderID__lock)
            defer { objc_sync_exit(purchaseOrderID__lock) }
            do {
                PurchaseOrderItem.purchaseOrderID_ = value
            }
        }
    }

    open var purchaseOrderID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: PurchaseOrderItem.purchaseOrderID))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.purchaseOrderID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var quantity: Property {
        get {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                return PurchaseOrderItem.quantity_
            }
        }
        set(value) {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                PurchaseOrderItem.quantity_ = value
            }
        }
    }

    open var quantity: Int? {
        get {
            return IntValue.optional(optionalValue(for: PurchaseOrderItem.quantity))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.quantity, to: IntValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var quantityUnit: Property {
        get {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                return PurchaseOrderItem.quantityUnit_
            }
        }
        set(value) {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                PurchaseOrderItem.quantityUnit_ = value
            }
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(optionalValue(for: PurchaseOrderItem.quantityUnit))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var taxAmount: Property {
        get {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                return PurchaseOrderItem.taxAmount_
            }
        }
        set(value) {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                PurchaseOrderItem.taxAmount_ = value
            }
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: PurchaseOrderItem.taxAmount))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderItem.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
