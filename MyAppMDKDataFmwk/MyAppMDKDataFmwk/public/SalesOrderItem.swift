// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class SalesOrderItem: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let currencyCode__lock = ObjectBase()

    private nonisolated(unsafe) static var currencyCode_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "CurrencyCode")

    private nonisolated(unsafe) static let deliveryDate__lock = ObjectBase()

    private nonisolated(unsafe) static var deliveryDate_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "DeliveryDate")

    private nonisolated(unsafe) static let grossAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var grossAmount_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "GrossAmount")

    private nonisolated(unsafe) static let itemNumber__lock = ObjectBase()

    private nonisolated(unsafe) static var itemNumber_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "ItemNumber")

    private nonisolated(unsafe) static let netAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var netAmount_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "NetAmount")

    private nonisolated(unsafe) static let productID__lock = ObjectBase()

    private nonisolated(unsafe) static var productID_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "ProductID")

    private nonisolated(unsafe) static let quantity__lock = ObjectBase()

    private nonisolated(unsafe) static var quantity_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "Quantity")

    private nonisolated(unsafe) static let quantityUnit__lock = ObjectBase()

    private nonisolated(unsafe) static var quantityUnit_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "QuantityUnit")

    private nonisolated(unsafe) static let salesOrderID__lock = ObjectBase()

    private nonisolated(unsafe) static var salesOrderID_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "SalesOrderID")

    private nonisolated(unsafe) static let taxAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var taxAmount_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "TaxAmount")

    private nonisolated(unsafe) static let product__lock = ObjectBase()

    private nonisolated(unsafe) static var product_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "Product")

    private nonisolated(unsafe) static let header__lock = ObjectBase()

    private nonisolated(unsafe) static var header_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "Header")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.salesOrderItem, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [SalesOrderItem] {
        return ArrayConverter.convert(from.toArray(), [SalesOrderItem]())
    }

    open func copy() -> SalesOrderItem {
        return CastRequired<SalesOrderItem>.from(copyEntity())
    }

    @inline(__always)
    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return SalesOrderItem.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                SalesOrderItem.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(optionalValue(for: SalesOrderItem.currencyCode))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.currencyCode, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var deliveryDate: Property {
        get {
            objc_sync_enter(deliveryDate__lock)
            defer { objc_sync_exit(deliveryDate__lock) }
            do {
                return SalesOrderItem.deliveryDate_
            }
        }
        set(value) {
            objc_sync_enter(deliveryDate__lock)
            defer { objc_sync_exit(deliveryDate__lock) }
            do {
                SalesOrderItem.deliveryDate_ = value
            }
        }
    }

    open var deliveryDate: LocalDate? {
        get {
            return LocalDate.castOptional(optionalValue(for: SalesOrderItem.deliveryDate))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.deliveryDate, to: value)
        }
    }

    @inline(__always)
    open class var grossAmount: Property {
        get {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                return SalesOrderItem.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                SalesOrderItem.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: SalesOrderItem.grossAmount))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var header: Property {
        get {
            objc_sync_enter(header__lock)
            defer { objc_sync_exit(header__lock) }
            do {
                return SalesOrderItem.header_
            }
        }
        set(value) {
            objc_sync_enter(header__lock)
            defer { objc_sync_exit(header__lock) }
            do {
                SalesOrderItem.header_ = value
            }
        }
    }

    open var header: SalesOrderHeader? {
        get {
            return CastOptional<SalesOrderHeader>.from(optionalValue(for: SalesOrderItem.header))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.header, to: value)
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
                return SalesOrderItem.itemNumber_
            }
        }
        set(value) {
            objc_sync_enter(itemNumber__lock)
            defer { objc_sync_exit(itemNumber__lock) }
            do {
                SalesOrderItem.itemNumber_ = value
            }
        }
    }

    open var itemNumber: Int? {
        get {
            return IntValue.optional(optionalValue(for: SalesOrderItem.itemNumber))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.itemNumber, to: IntValue.of(optional: value))
        }
    }

    open class func key(itemNumber: Int?, salesOrderID: Int64?) -> EntityKey {
        return EntityKey().with(name: "ItemNumber", value: IntValue.of(optional: itemNumber)).with(name: "SalesOrderID", value: LongValue.of(optional: salesOrderID))
    }

    @inline(__always)
    open class var netAmount: Property {
        get {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                return SalesOrderItem.netAmount_
            }
        }
        set(value) {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                SalesOrderItem.netAmount_ = value
            }
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: SalesOrderItem.netAmount))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: SalesOrderItem {
        return CastRequired<SalesOrderItem>.from(oldEntity)
    }

    @inline(__always)
    open class var product: Property {
        get {
            objc_sync_enter(product__lock)
            defer { objc_sync_exit(product__lock) }
            do {
                return SalesOrderItem.product_
            }
        }
        set(value) {
            objc_sync_enter(product__lock)
            defer { objc_sync_exit(product__lock) }
            do {
                SalesOrderItem.product_ = value
            }
        }
    }

    open var product: Product? {
        get {
            return CastOptional<Product>.from(optionalValue(for: SalesOrderItem.product))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.product, to: value)
        }
    }

    @inline(__always)
    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return SalesOrderItem.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                SalesOrderItem.productID_ = value
            }
        }
    }

    open var productID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: SalesOrderItem.productID))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.productID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var quantity: Property {
        get {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                return SalesOrderItem.quantity_
            }
        }
        set(value) {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                SalesOrderItem.quantity_ = value
            }
        }
    }

    open var quantity: Int? {
        get {
            return IntValue.optional(optionalValue(for: SalesOrderItem.quantity))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.quantity, to: IntValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var quantityUnit: Property {
        get {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                return SalesOrderItem.quantityUnit_
            }
        }
        set(value) {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                SalesOrderItem.quantityUnit_ = value
            }
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(optionalValue(for: SalesOrderItem.quantityUnit))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var salesOrderID: Property {
        get {
            objc_sync_enter(salesOrderID__lock)
            defer { objc_sync_exit(salesOrderID__lock) }
            do {
                return SalesOrderItem.salesOrderID_
            }
        }
        set(value) {
            objc_sync_enter(salesOrderID__lock)
            defer { objc_sync_exit(salesOrderID__lock) }
            do {
                SalesOrderItem.salesOrderID_ = value
            }
        }
    }

    open var salesOrderID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: SalesOrderItem.salesOrderID))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.salesOrderID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var taxAmount: Property {
        get {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                return SalesOrderItem.taxAmount_
            }
        }
        set(value) {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                SalesOrderItem.taxAmount_ = value
            }
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: SalesOrderItem.taxAmount))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
