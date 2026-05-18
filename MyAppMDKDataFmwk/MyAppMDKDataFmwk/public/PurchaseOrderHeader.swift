// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class PurchaseOrderHeader: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let currencyCode__lock = ObjectBase()

    private nonisolated(unsafe) static var currencyCode_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "CurrencyCode")

    private nonisolated(unsafe) static let grossAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var grossAmount_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "GrossAmount")

    private nonisolated(unsafe) static let netAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var netAmount_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "NetAmount")

    private nonisolated(unsafe) static let purchaseOrderID__lock = ObjectBase()

    private nonisolated(unsafe) static var purchaseOrderID_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "PurchaseOrderID")

    private nonisolated(unsafe) static let supplierID__lock = ObjectBase()

    private nonisolated(unsafe) static var supplierID_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "SupplierID")

    private nonisolated(unsafe) static let taxAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var taxAmount_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "TaxAmount")

    private nonisolated(unsafe) static let supplier__lock = ObjectBase()

    private nonisolated(unsafe) static var supplier_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Supplier")

    private nonisolated(unsafe) static let items__lock = ObjectBase()

    private nonisolated(unsafe) static var items_: Property = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Items")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [PurchaseOrderHeader] {
        return ArrayConverter.convert(from.toArray(), [PurchaseOrderHeader]())
    }

    open func copy() -> PurchaseOrderHeader {
        return CastRequired<PurchaseOrderHeader>.from(copyEntity())
    }

    @inline(__always)
    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return PurchaseOrderHeader.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                PurchaseOrderHeader.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(optionalValue(for: PurchaseOrderHeader.currencyCode))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderHeader.currencyCode, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var grossAmount: Property {
        get {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                return PurchaseOrderHeader.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                PurchaseOrderHeader.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: PurchaseOrderHeader.grossAmount))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderHeader.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    override open var isProxy: Bool {
        return true
    }

    @inline(__always)
    open class var items: Property {
        get {
            objc_sync_enter(items__lock)
            defer { objc_sync_exit(items__lock) }
            do {
                return PurchaseOrderHeader.items_
            }
        }
        set(value) {
            objc_sync_enter(items__lock)
            defer { objc_sync_exit(items__lock) }
            do {
                PurchaseOrderHeader.items_ = value
            }
        }
    }

    open var items: [PurchaseOrderItem] {
        get {
            return ArrayConverter.convert(PurchaseOrderHeader.items.entityList(from: self).toArray(), [PurchaseOrderItem]())
        }
        set(value) {
            PurchaseOrderHeader.items.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class func key(purchaseOrderID: Int64?) -> EntityKey {
        return EntityKey().with(name: "PurchaseOrderID", value: LongValue.of(optional: purchaseOrderID))
    }

    @inline(__always)
    open class var netAmount: Property {
        get {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                return PurchaseOrderHeader.netAmount_
            }
        }
        set(value) {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                PurchaseOrderHeader.netAmount_ = value
            }
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: PurchaseOrderHeader.netAmount))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderHeader.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: PurchaseOrderHeader {
        return CastRequired<PurchaseOrderHeader>.from(oldEntity)
    }

    @inline(__always)
    open class var purchaseOrderID: Property {
        get {
            objc_sync_enter(purchaseOrderID__lock)
            defer { objc_sync_exit(purchaseOrderID__lock) }
            do {
                return PurchaseOrderHeader.purchaseOrderID_
            }
        }
        set(value) {
            objc_sync_enter(purchaseOrderID__lock)
            defer { objc_sync_exit(purchaseOrderID__lock) }
            do {
                PurchaseOrderHeader.purchaseOrderID_ = value
            }
        }
    }

    open var purchaseOrderID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: PurchaseOrderHeader.purchaseOrderID))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderHeader.purchaseOrderID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var supplier: Property {
        get {
            objc_sync_enter(supplier__lock)
            defer { objc_sync_exit(supplier__lock) }
            do {
                return PurchaseOrderHeader.supplier_
            }
        }
        set(value) {
            objc_sync_enter(supplier__lock)
            defer { objc_sync_exit(supplier__lock) }
            do {
                PurchaseOrderHeader.supplier_ = value
            }
        }
    }

    open var supplier: Supplier? {
        get {
            return CastOptional<Supplier>.from(optionalValue(for: PurchaseOrderHeader.supplier))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderHeader.supplier, to: value)
        }
    }

    @inline(__always)
    open class var supplierID: Property {
        get {
            objc_sync_enter(supplierID__lock)
            defer { objc_sync_exit(supplierID__lock) }
            do {
                return PurchaseOrderHeader.supplierID_
            }
        }
        set(value) {
            objc_sync_enter(supplierID__lock)
            defer { objc_sync_exit(supplierID__lock) }
            do {
                PurchaseOrderHeader.supplierID_ = value
            }
        }
    }

    open var supplierID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: PurchaseOrderHeader.supplierID))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderHeader.supplierID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var taxAmount: Property {
        get {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                return PurchaseOrderHeader.taxAmount_
            }
        }
        set(value) {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                PurchaseOrderHeader.taxAmount_ = value
            }
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: PurchaseOrderHeader.taxAmount))
        }
        set(value) {
            setOptionalValue(for: PurchaseOrderHeader.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
