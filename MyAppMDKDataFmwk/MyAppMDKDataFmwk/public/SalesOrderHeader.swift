// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class SalesOrderHeader: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let createdAt__lock = ObjectBase()

    private nonisolated(unsafe) static var createdAt_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "CreatedAt")

    private nonisolated(unsafe) static let currencyCode__lock = ObjectBase()

    private nonisolated(unsafe) static var currencyCode_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "CurrencyCode")

    private nonisolated(unsafe) static let customerID__lock = ObjectBase()

    private nonisolated(unsafe) static var customerID_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerID")

    private nonisolated(unsafe) static let grossAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var grossAmount_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "GrossAmount")

    private nonisolated(unsafe) static let lifeCycleStatus__lock = ObjectBase()

    private nonisolated(unsafe) static var lifeCycleStatus_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatus")

    private nonisolated(unsafe) static let lifeCycleStatusName__lock = ObjectBase()

    private nonisolated(unsafe) static var lifeCycleStatusName_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatusName")

    private nonisolated(unsafe) static let netAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var netAmount_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "NetAmount")

    private nonisolated(unsafe) static let salesOrderID__lock = ObjectBase()

    private nonisolated(unsafe) static var salesOrderID_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "SalesOrderID")

    private nonisolated(unsafe) static let taxAmount__lock = ObjectBase()

    private nonisolated(unsafe) static var taxAmount_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "TaxAmount")

    private nonisolated(unsafe) static let customer__lock = ObjectBase()

    private nonisolated(unsafe) static var customer_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "Customer")

    private nonisolated(unsafe) static let items__lock = ObjectBase()

    private nonisolated(unsafe) static var items_: Property = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "Items")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.salesOrderHeader, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [SalesOrderHeader] {
        return ArrayConverter.convert(from.toArray(), [SalesOrderHeader]())
    }

    open func copy() -> SalesOrderHeader {
        return CastRequired<SalesOrderHeader>.from(copyEntity())
    }

    @inline(__always)
    open class var createdAt: Property {
        get {
            objc_sync_enter(createdAt__lock)
            defer { objc_sync_exit(createdAt__lock) }
            do {
                return SalesOrderHeader.createdAt_
            }
        }
        set(value) {
            objc_sync_enter(createdAt__lock)
            defer { objc_sync_exit(createdAt__lock) }
            do {
                SalesOrderHeader.createdAt_ = value
            }
        }
    }

    open var createdAt: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(optionalValue(for: SalesOrderHeader.createdAt))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.createdAt, to: value)
        }
    }

    @inline(__always)
    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return SalesOrderHeader.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                SalesOrderHeader.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(optionalValue(for: SalesOrderHeader.currencyCode))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.currencyCode, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var customer: Property {
        get {
            objc_sync_enter(customer__lock)
            defer { objc_sync_exit(customer__lock) }
            do {
                return SalesOrderHeader.customer_
            }
        }
        set(value) {
            objc_sync_enter(customer__lock)
            defer { objc_sync_exit(customer__lock) }
            do {
                SalesOrderHeader.customer_ = value
            }
        }
    }

    open var customer: Customer? {
        get {
            return CastOptional<Customer>.from(optionalValue(for: SalesOrderHeader.customer))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.customer, to: value)
        }
    }

    @inline(__always)
    open class var customerID: Property {
        get {
            objc_sync_enter(customerID__lock)
            defer { objc_sync_exit(customerID__lock) }
            do {
                return SalesOrderHeader.customerID_
            }
        }
        set(value) {
            objc_sync_enter(customerID__lock)
            defer { objc_sync_exit(customerID__lock) }
            do {
                SalesOrderHeader.customerID_ = value
            }
        }
    }

    open var customerID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: SalesOrderHeader.customerID))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.customerID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var grossAmount: Property {
        get {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                return SalesOrderHeader.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                SalesOrderHeader.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: SalesOrderHeader.grossAmount))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.grossAmount, to: DecimalValue.of(optional: value))
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
                return SalesOrderHeader.items_
            }
        }
        set(value) {
            objc_sync_enter(items__lock)
            defer { objc_sync_exit(items__lock) }
            do {
                SalesOrderHeader.items_ = value
            }
        }
    }

    open var items: [SalesOrderItem] {
        get {
            return ArrayConverter.convert(SalesOrderHeader.items.entityList(from: self).toArray(), [SalesOrderItem]())
        }
        set(value) {
            SalesOrderHeader.items.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class func key(salesOrderID: Int64?) -> EntityKey {
        return EntityKey().with(name: "SalesOrderID", value: LongValue.of(optional: salesOrderID))
    }

    @inline(__always)
    open class var lifeCycleStatus: Property {
        get {
            objc_sync_enter(lifeCycleStatus__lock)
            defer { objc_sync_exit(lifeCycleStatus__lock) }
            do {
                return SalesOrderHeader.lifeCycleStatus_
            }
        }
        set(value) {
            objc_sync_enter(lifeCycleStatus__lock)
            defer { objc_sync_exit(lifeCycleStatus__lock) }
            do {
                SalesOrderHeader.lifeCycleStatus_ = value
            }
        }
    }

    open var lifeCycleStatus: String? {
        get {
            return StringValue.optional(optionalValue(for: SalesOrderHeader.lifeCycleStatus))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.lifeCycleStatus, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var lifeCycleStatusName: Property {
        get {
            objc_sync_enter(lifeCycleStatusName__lock)
            defer { objc_sync_exit(lifeCycleStatusName__lock) }
            do {
                return SalesOrderHeader.lifeCycleStatusName_
            }
        }
        set(value) {
            objc_sync_enter(lifeCycleStatusName__lock)
            defer { objc_sync_exit(lifeCycleStatusName__lock) }
            do {
                SalesOrderHeader.lifeCycleStatusName_ = value
            }
        }
    }

    open var lifeCycleStatusName: String? {
        get {
            return StringValue.optional(optionalValue(for: SalesOrderHeader.lifeCycleStatusName))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.lifeCycleStatusName, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var netAmount: Property {
        get {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                return SalesOrderHeader.netAmount_
            }
        }
        set(value) {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                SalesOrderHeader.netAmount_ = value
            }
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: SalesOrderHeader.netAmount))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: SalesOrderHeader {
        return CastRequired<SalesOrderHeader>.from(oldEntity)
    }

    @inline(__always)
    open class var salesOrderID: Property {
        get {
            objc_sync_enter(salesOrderID__lock)
            defer { objc_sync_exit(salesOrderID__lock) }
            do {
                return SalesOrderHeader.salesOrderID_
            }
        }
        set(value) {
            objc_sync_enter(salesOrderID__lock)
            defer { objc_sync_exit(salesOrderID__lock) }
            do {
                SalesOrderHeader.salesOrderID_ = value
            }
        }
    }

    open var salesOrderID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: SalesOrderHeader.salesOrderID))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.salesOrderID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var taxAmount: Property {
        get {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                return SalesOrderHeader.taxAmount_
            }
        }
        set(value) {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                SalesOrderHeader.taxAmount_ = value
            }
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: SalesOrderHeader.taxAmount))
        }
        set(value) {
            setOptionalValue(for: SalesOrderHeader.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
