// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class Customer: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let city__lock = ObjectBase()

    private nonisolated(unsafe) static var city_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "City")

    private nonisolated(unsafe) static let country__lock = ObjectBase()

    private nonisolated(unsafe) static var country_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "Country")

    private nonisolated(unsafe) static let customerID__lock = ObjectBase()

    private nonisolated(unsafe) static var customerID_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "CustomerID")

    private nonisolated(unsafe) static let dateOfBirth__lock = ObjectBase()

    private nonisolated(unsafe) static var dateOfBirth_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "DateOfBirth")

    private nonisolated(unsafe) static let emailAddress__lock = ObjectBase()

    private nonisolated(unsafe) static var emailAddress_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "EmailAddress")

    private nonisolated(unsafe) static let gender__lock = ObjectBase()

    private nonisolated(unsafe) static var gender_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "Gender")

    private nonisolated(unsafe) static let firstName__lock = ObjectBase()

    private nonisolated(unsafe) static var firstName_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "FirstName")

    private nonisolated(unsafe) static let houseNumber__lock = ObjectBase()

    private nonisolated(unsafe) static var houseNumber_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "HouseNumber")

    private nonisolated(unsafe) static let lastName__lock = ObjectBase()

    private nonisolated(unsafe) static var lastName_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "LastName")

    private nonisolated(unsafe) static let phoneNumber__lock = ObjectBase()

    private nonisolated(unsafe) static var phoneNumber_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "PhoneNumber")

    private nonisolated(unsafe) static let postalCode__lock = ObjectBase()

    private nonisolated(unsafe) static var postalCode_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "PostalCode")

    private nonisolated(unsafe) static let street__lock = ObjectBase()

    private nonisolated(unsafe) static var street_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "Street")

    private nonisolated(unsafe) static let address__lock = ObjectBase()

    private nonisolated(unsafe) static var address_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "Address")

    private nonisolated(unsafe) static let salesOrders__lock = ObjectBase()

    private nonisolated(unsafe) static var salesOrders_: Property = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "SalesOrders")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.customer, withIndexMap: withIndexMap)
    }

    @inline(__always)
    open class var address: Property {
        get {
            objc_sync_enter(address__lock)
            defer { objc_sync_exit(address__lock) }
            do {
                return Customer.address_
            }
        }
        set(value) {
            objc_sync_enter(address__lock)
            defer { objc_sync_exit(address__lock) }
            do {
                Customer.address_ = value
            }
        }
    }

    open var address: Address? {
        get {
            return CastOptional<Address>.from(optionalValue(for: Customer.address))
        }
        set(value) {
            setOptionalValue(for: Customer.address, to: value)
        }
    }

    open class func array(from: EntityValueList) -> [Customer] {
        return ArrayConverter.convert(from.toArray(), [Customer]())
    }

    @inline(__always)
    open class var city: Property {
        get {
            objc_sync_enter(city__lock)
            defer { objc_sync_exit(city__lock) }
            do {
                return Customer.city_
            }
        }
        set(value) {
            objc_sync_enter(city__lock)
            defer { objc_sync_exit(city__lock) }
            do {
                Customer.city_ = value
            }
        }
    }

    open var city: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.city))
        }
        set(value) {
            setOptionalValue(for: Customer.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Customer {
        return CastRequired<Customer>.from(copyEntity())
    }

    @inline(__always)
    open class var country: Property {
        get {
            objc_sync_enter(country__lock)
            defer { objc_sync_exit(country__lock) }
            do {
                return Customer.country_
            }
        }
        set(value) {
            objc_sync_enter(country__lock)
            defer { objc_sync_exit(country__lock) }
            do {
                Customer.country_ = value
            }
        }
    }

    open var country: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.country))
        }
        set(value) {
            setOptionalValue(for: Customer.country, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var customerID: Property {
        get {
            objc_sync_enter(customerID__lock)
            defer { objc_sync_exit(customerID__lock) }
            do {
                return Customer.customerID_
            }
        }
        set(value) {
            objc_sync_enter(customerID__lock)
            defer { objc_sync_exit(customerID__lock) }
            do {
                Customer.customerID_ = value
            }
        }
    }

    open var customerID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: Customer.customerID))
        }
        set(value) {
            setOptionalValue(for: Customer.customerID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var dateOfBirth: Property {
        get {
            objc_sync_enter(dateOfBirth__lock)
            defer { objc_sync_exit(dateOfBirth__lock) }
            do {
                return Customer.dateOfBirth_
            }
        }
        set(value) {
            objc_sync_enter(dateOfBirth__lock)
            defer { objc_sync_exit(dateOfBirth__lock) }
            do {
                Customer.dateOfBirth_ = value
            }
        }
    }

    open var dateOfBirth: LocalDate? {
        get {
            return LocalDate.castOptional(optionalValue(for: Customer.dateOfBirth))
        }
        set(value) {
            setOptionalValue(for: Customer.dateOfBirth, to: value)
        }
    }

    @inline(__always)
    open class var emailAddress: Property {
        get {
            objc_sync_enter(emailAddress__lock)
            defer { objc_sync_exit(emailAddress__lock) }
            do {
                return Customer.emailAddress_
            }
        }
        set(value) {
            objc_sync_enter(emailAddress__lock)
            defer { objc_sync_exit(emailAddress__lock) }
            do {
                Customer.emailAddress_ = value
            }
        }
    }

    open var emailAddress: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.emailAddress))
        }
        set(value) {
            setOptionalValue(for: Customer.emailAddress, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var firstName: Property {
        get {
            objc_sync_enter(firstName__lock)
            defer { objc_sync_exit(firstName__lock) }
            do {
                return Customer.firstName_
            }
        }
        set(value) {
            objc_sync_enter(firstName__lock)
            defer { objc_sync_exit(firstName__lock) }
            do {
                Customer.firstName_ = value
            }
        }
    }

    open var firstName: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.firstName))
        }
        set(value) {
            setOptionalValue(for: Customer.firstName, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var gender: Property {
        get {
            objc_sync_enter(gender__lock)
            defer { objc_sync_exit(gender__lock) }
            do {
                return Customer.gender_
            }
        }
        set(value) {
            objc_sync_enter(gender__lock)
            defer { objc_sync_exit(gender__lock) }
            do {
                Customer.gender_ = value
            }
        }
    }

    open var gender: Gender? {
        get {
            return GenderConvert.fromOptionalEnumValue(optionalValue(for: Customer.gender))
        }
        set(value) {
            setOptionalValue(for: Customer.gender, to: GenderConvert.toOptionalEnumValue(value))
        }
    }

    @inline(__always)
    open class var houseNumber: Property {
        get {
            objc_sync_enter(houseNumber__lock)
            defer { objc_sync_exit(houseNumber__lock) }
            do {
                return Customer.houseNumber_
            }
        }
        set(value) {
            objc_sync_enter(houseNumber__lock)
            defer { objc_sync_exit(houseNumber__lock) }
            do {
                Customer.houseNumber_ = value
            }
        }
    }

    open var houseNumber: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.houseNumber))
        }
        set(value) {
            setOptionalValue(for: Customer.houseNumber, to: StringValue.of(optional: value))
        }
    }

    override open var isProxy: Bool {
        return true
    }

    open class func key(customerID: Int64?) -> EntityKey {
        return EntityKey().with(name: "CustomerID", value: LongValue.of(optional: customerID))
    }

    @inline(__always)
    open class var lastName: Property {
        get {
            objc_sync_enter(lastName__lock)
            defer { objc_sync_exit(lastName__lock) }
            do {
                return Customer.lastName_
            }
        }
        set(value) {
            objc_sync_enter(lastName__lock)
            defer { objc_sync_exit(lastName__lock) }
            do {
                Customer.lastName_ = value
            }
        }
    }

    open var lastName: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.lastName))
        }
        set(value) {
            setOptionalValue(for: Customer.lastName, to: StringValue.of(optional: value))
        }
    }

    open var old: Customer {
        return CastRequired<Customer>.from(oldEntity)
    }

    @inline(__always)
    open class var phoneNumber: Property {
        get {
            objc_sync_enter(phoneNumber__lock)
            defer { objc_sync_exit(phoneNumber__lock) }
            do {
                return Customer.phoneNumber_
            }
        }
        set(value) {
            objc_sync_enter(phoneNumber__lock)
            defer { objc_sync_exit(phoneNumber__lock) }
            do {
                Customer.phoneNumber_ = value
            }
        }
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.phoneNumber))
        }
        set(value) {
            setOptionalValue(for: Customer.phoneNumber, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var postalCode: Property {
        get {
            objc_sync_enter(postalCode__lock)
            defer { objc_sync_exit(postalCode__lock) }
            do {
                return Customer.postalCode_
            }
        }
        set(value) {
            objc_sync_enter(postalCode__lock)
            defer { objc_sync_exit(postalCode__lock) }
            do {
                Customer.postalCode_ = value
            }
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.postalCode))
        }
        set(value) {
            setOptionalValue(for: Customer.postalCode, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var salesOrders: Property {
        get {
            objc_sync_enter(salesOrders__lock)
            defer { objc_sync_exit(salesOrders__lock) }
            do {
                return Customer.salesOrders_
            }
        }
        set(value) {
            objc_sync_enter(salesOrders__lock)
            defer { objc_sync_exit(salesOrders__lock) }
            do {
                Customer.salesOrders_ = value
            }
        }
    }

    open var salesOrders: [SalesOrderHeader] {
        get {
            return ArrayConverter.convert(Customer.salesOrders.entityList(from: self).toArray(), [SalesOrderHeader]())
        }
        set(value) {
            Customer.salesOrders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    @inline(__always)
    open class var street: Property {
        get {
            objc_sync_enter(street__lock)
            defer { objc_sync_exit(street__lock) }
            do {
                return Customer.street_
            }
        }
        set(value) {
            objc_sync_enter(street__lock)
            defer { objc_sync_exit(street__lock) }
            do {
                Customer.street_ = value
            }
        }
    }

    open var street: String? {
        get {
            return StringValue.optional(optionalValue(for: Customer.street))
        }
        set(value) {
            setOptionalValue(for: Customer.street, to: StringValue.of(optional: value))
        }
    }
}
