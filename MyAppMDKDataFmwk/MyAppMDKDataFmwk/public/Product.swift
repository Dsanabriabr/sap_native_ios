// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class Product: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let category__lock = ObjectBase()

    private nonisolated(unsafe) static var category_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Category")

    private nonisolated(unsafe) static let categoryName__lock = ObjectBase()

    private nonisolated(unsafe) static var categoryName_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "CategoryName")

    private nonisolated(unsafe) static let currencyCode__lock = ObjectBase()

    private nonisolated(unsafe) static var currencyCode_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "CurrencyCode")

    private nonisolated(unsafe) static let dimensionDepth__lock = ObjectBase()

    private nonisolated(unsafe) static var dimensionDepth_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "DimensionDepth")

    private nonisolated(unsafe) static let dimensionHeight__lock = ObjectBase()

    private nonisolated(unsafe) static var dimensionHeight_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "DimensionHeight")

    private nonisolated(unsafe) static let dimensionUnit__lock = ObjectBase()

    private nonisolated(unsafe) static var dimensionUnit_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "DimensionUnit")

    private nonisolated(unsafe) static let dimensionWidth__lock = ObjectBase()

    private nonisolated(unsafe) static var dimensionWidth_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "DimensionWidth")

    private nonisolated(unsafe) static let longDescription__lock = ObjectBase()

    private nonisolated(unsafe) static var longDescription_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "LongDescription")

    private nonisolated(unsafe) static let name__lock = ObjectBase()

    private nonisolated(unsafe) static var name_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Name")

    private nonisolated(unsafe) static let pictureUrl__lock = ObjectBase()

    private nonisolated(unsafe) static var pictureUrl_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "PictureUrl")

    private nonisolated(unsafe) static let price__lock = ObjectBase()

    private nonisolated(unsafe) static var price_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Price")

    private nonisolated(unsafe) static let productID__lock = ObjectBase()

    private nonisolated(unsafe) static var productID_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "ProductID")

    private nonisolated(unsafe) static let quantityUnit__lock = ObjectBase()

    private nonisolated(unsafe) static var quantityUnit_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "QuantityUnit")

    private nonisolated(unsafe) static let shortDescription__lock = ObjectBase()

    private nonisolated(unsafe) static var shortDescription_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "ShortDescription")

    private nonisolated(unsafe) static let supplierID__lock = ObjectBase()

    private nonisolated(unsafe) static var supplierID_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "SupplierID")

    private nonisolated(unsafe) static let weight__lock = ObjectBase()

    private nonisolated(unsafe) static var weight_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Weight")

    private nonisolated(unsafe) static let weightUnit__lock = ObjectBase()

    private nonisolated(unsafe) static var weightUnit_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "WeightUnit")

    private nonisolated(unsafe) static let picture__lock = ObjectBase()

    private nonisolated(unsafe) static var picture_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Picture")

    private nonisolated(unsafe) static let supplier__lock = ObjectBase()

    private nonisolated(unsafe) static var supplier_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Supplier")

    private nonisolated(unsafe) static let stock__lock = ObjectBase()

    private nonisolated(unsafe) static var stock_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Stock")

    private nonisolated(unsafe) static let purchaseOrderItems__lock = ObjectBase()

    private nonisolated(unsafe) static var purchaseOrderItems_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "PurchaseOrderItems")

    private nonisolated(unsafe) static let salesOrderItems__lock = ObjectBase()

    private nonisolated(unsafe) static var salesOrderItems_: Property = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "SalesOrderItems")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.product, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [Product] {
        return ArrayConverter.convert(from.toArray(), [Product]())
    }

    @inline(__always)
    open class var category: Property {
        get {
            objc_sync_enter(category__lock)
            defer { objc_sync_exit(category__lock) }
            do {
                return Product.category_
            }
        }
        set(value) {
            objc_sync_enter(category__lock)
            defer { objc_sync_exit(category__lock) }
            do {
                Product.category_ = value
            }
        }
    }

    open var category: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.category))
        }
        set(value) {
            setOptionalValue(for: Product.category, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var categoryName: Property {
        get {
            objc_sync_enter(categoryName__lock)
            defer { objc_sync_exit(categoryName__lock) }
            do {
                return Product.categoryName_
            }
        }
        set(value) {
            objc_sync_enter(categoryName__lock)
            defer { objc_sync_exit(categoryName__lock) }
            do {
                Product.categoryName_ = value
            }
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.categoryName))
        }
        set(value) {
            setOptionalValue(for: Product.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Product {
        return CastRequired<Product>.from(copyEntity())
    }

    @inline(__always)
    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return Product.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                Product.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.currencyCode))
        }
        set(value) {
            setOptionalValue(for: Product.currencyCode, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var dimensionDepth: Property {
        get {
            objc_sync_enter(dimensionDepth__lock)
            defer { objc_sync_exit(dimensionDepth__lock) }
            do {
                return Product.dimensionDepth_
            }
        }
        set(value) {
            objc_sync_enter(dimensionDepth__lock)
            defer { objc_sync_exit(dimensionDepth__lock) }
            do {
                Product.dimensionDepth_ = value
            }
        }
    }

    open var dimensionDepth: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: Product.dimensionDepth))
        }
        set(value) {
            setOptionalValue(for: Product.dimensionDepth, to: DecimalValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var dimensionHeight: Property {
        get {
            objc_sync_enter(dimensionHeight__lock)
            defer { objc_sync_exit(dimensionHeight__lock) }
            do {
                return Product.dimensionHeight_
            }
        }
        set(value) {
            objc_sync_enter(dimensionHeight__lock)
            defer { objc_sync_exit(dimensionHeight__lock) }
            do {
                Product.dimensionHeight_ = value
            }
        }
    }

    open var dimensionHeight: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: Product.dimensionHeight))
        }
        set(value) {
            setOptionalValue(for: Product.dimensionHeight, to: DecimalValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var dimensionUnit: Property {
        get {
            objc_sync_enter(dimensionUnit__lock)
            defer { objc_sync_exit(dimensionUnit__lock) }
            do {
                return Product.dimensionUnit_
            }
        }
        set(value) {
            objc_sync_enter(dimensionUnit__lock)
            defer { objc_sync_exit(dimensionUnit__lock) }
            do {
                Product.dimensionUnit_ = value
            }
        }
    }

    open var dimensionUnit: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.dimensionUnit))
        }
        set(value) {
            setOptionalValue(for: Product.dimensionUnit, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var dimensionWidth: Property {
        get {
            objc_sync_enter(dimensionWidth__lock)
            defer { objc_sync_exit(dimensionWidth__lock) }
            do {
                return Product.dimensionWidth_
            }
        }
        set(value) {
            objc_sync_enter(dimensionWidth__lock)
            defer { objc_sync_exit(dimensionWidth__lock) }
            do {
                Product.dimensionWidth_ = value
            }
        }
    }

    open var dimensionWidth: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: Product.dimensionWidth))
        }
        set(value) {
            setOptionalValue(for: Product.dimensionWidth, to: DecimalValue.of(optional: value))
        }
    }

    override open var isProxy: Bool {
        return true
    }

    open class func key(productID: Int64?) -> EntityKey {
        return EntityKey().with(name: "ProductID", value: LongValue.of(optional: productID))
    }

    @inline(__always)
    open class var longDescription: Property {
        get {
            objc_sync_enter(longDescription__lock)
            defer { objc_sync_exit(longDescription__lock) }
            do {
                return Product.longDescription_
            }
        }
        set(value) {
            objc_sync_enter(longDescription__lock)
            defer { objc_sync_exit(longDescription__lock) }
            do {
                Product.longDescription_ = value
            }
        }
    }

    open var longDescription: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.longDescription))
        }
        set(value) {
            setOptionalValue(for: Product.longDescription, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var name: Property {
        get {
            objc_sync_enter(name__lock)
            defer { objc_sync_exit(name__lock) }
            do {
                return Product.name_
            }
        }
        set(value) {
            objc_sync_enter(name__lock)
            defer { objc_sync_exit(name__lock) }
            do {
                Product.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.name))
        }
        set(value) {
            setOptionalValue(for: Product.name, to: StringValue.of(optional: value))
        }
    }

    open var old: Product {
        return CastRequired<Product>.from(oldEntity)
    }

    @inline(__always)
    open class var picture: Property {
        get {
            objc_sync_enter(picture__lock)
            defer { objc_sync_exit(picture__lock) }
            do {
                return Product.picture_
            }
        }
        set(value) {
            objc_sync_enter(picture__lock)
            defer { objc_sync_exit(picture__lock) }
            do {
                Product.picture_ = value
            }
        }
    }

    open var picture: StreamLink {
        return streamLink(for: Product.picture)
    }

    @inline(__always)
    open class var pictureUrl: Property {
        get {
            objc_sync_enter(pictureUrl__lock)
            defer { objc_sync_exit(pictureUrl__lock) }
            do {
                return Product.pictureUrl_
            }
        }
        set(value) {
            objc_sync_enter(pictureUrl__lock)
            defer { objc_sync_exit(pictureUrl__lock) }
            do {
                Product.pictureUrl_ = value
            }
        }
    }

    open var pictureUrl: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.pictureUrl))
        }
        set(value) {
            setOptionalValue(for: Product.pictureUrl, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var price: Property {
        get {
            objc_sync_enter(price__lock)
            defer { objc_sync_exit(price__lock) }
            do {
                return Product.price_
            }
        }
        set(value) {
            objc_sync_enter(price__lock)
            defer { objc_sync_exit(price__lock) }
            do {
                Product.price_ = value
            }
        }
    }

    open var price: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: Product.price))
        }
        set(value) {
            setOptionalValue(for: Product.price, to: DecimalValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return Product.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                Product.productID_ = value
            }
        }
    }

    open var productID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: Product.productID))
        }
        set(value) {
            setOptionalValue(for: Product.productID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var purchaseOrderItems: Property {
        get {
            objc_sync_enter(purchaseOrderItems__lock)
            defer { objc_sync_exit(purchaseOrderItems__lock) }
            do {
                return Product.purchaseOrderItems_
            }
        }
        set(value) {
            objc_sync_enter(purchaseOrderItems__lock)
            defer { objc_sync_exit(purchaseOrderItems__lock) }
            do {
                Product.purchaseOrderItems_ = value
            }
        }
    }

    open var purchaseOrderItems: [PurchaseOrderItem] {
        get {
            return ArrayConverter.convert(Product.purchaseOrderItems.entityList(from: self).toArray(), [PurchaseOrderItem]())
        }
        set(value) {
            Product.purchaseOrderItems.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    @inline(__always)
    open class var quantityUnit: Property {
        get {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                return Product.quantityUnit_
            }
        }
        set(value) {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                Product.quantityUnit_ = value
            }
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.quantityUnit))
        }
        set(value) {
            setOptionalValue(for: Product.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var salesOrderItems: Property {
        get {
            objc_sync_enter(salesOrderItems__lock)
            defer { objc_sync_exit(salesOrderItems__lock) }
            do {
                return Product.salesOrderItems_
            }
        }
        set(value) {
            objc_sync_enter(salesOrderItems__lock)
            defer { objc_sync_exit(salesOrderItems__lock) }
            do {
                Product.salesOrderItems_ = value
            }
        }
    }

    open var salesOrderItems: [SalesOrderItem] {
        get {
            return ArrayConverter.convert(Product.salesOrderItems.entityList(from: self).toArray(), [SalesOrderItem]())
        }
        set(value) {
            Product.salesOrderItems.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    @inline(__always)
    open class var shortDescription: Property {
        get {
            objc_sync_enter(shortDescription__lock)
            defer { objc_sync_exit(shortDescription__lock) }
            do {
                return Product.shortDescription_
            }
        }
        set(value) {
            objc_sync_enter(shortDescription__lock)
            defer { objc_sync_exit(shortDescription__lock) }
            do {
                Product.shortDescription_ = value
            }
        }
    }

    open var shortDescription: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.shortDescription))
        }
        set(value) {
            setOptionalValue(for: Product.shortDescription, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var stock: Property {
        get {
            objc_sync_enter(stock__lock)
            defer { objc_sync_exit(stock__lock) }
            do {
                return Product.stock_
            }
        }
        set(value) {
            objc_sync_enter(stock__lock)
            defer { objc_sync_exit(stock__lock) }
            do {
                Product.stock_ = value
            }
        }
    }

    open var stock: Stock? {
        get {
            return CastOptional<Stock>.from(optionalValue(for: Product.stock))
        }
        set(value) {
            setOptionalValue(for: Product.stock, to: value)
        }
    }

    @inline(__always)
    open class var supplier: Property {
        get {
            objc_sync_enter(supplier__lock)
            defer { objc_sync_exit(supplier__lock) }
            do {
                return Product.supplier_
            }
        }
        set(value) {
            objc_sync_enter(supplier__lock)
            defer { objc_sync_exit(supplier__lock) }
            do {
                Product.supplier_ = value
            }
        }
    }

    open var supplier: Supplier? {
        get {
            return CastOptional<Supplier>.from(optionalValue(for: Product.supplier))
        }
        set(value) {
            setOptionalValue(for: Product.supplier, to: value)
        }
    }

    @inline(__always)
    open class var supplierID: Property {
        get {
            objc_sync_enter(supplierID__lock)
            defer { objc_sync_exit(supplierID__lock) }
            do {
                return Product.supplierID_
            }
        }
        set(value) {
            objc_sync_enter(supplierID__lock)
            defer { objc_sync_exit(supplierID__lock) }
            do {
                Product.supplierID_ = value
            }
        }
    }

    open var supplierID: Int64? {
        get {
            return LongValue.optional(optionalValue(for: Product.supplierID))
        }
        set(value) {
            setOptionalValue(for: Product.supplierID, to: LongValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var weight: Property {
        get {
            objc_sync_enter(weight__lock)
            defer { objc_sync_exit(weight__lock) }
            do {
                return Product.weight_
            }
        }
        set(value) {
            objc_sync_enter(weight__lock)
            defer { objc_sync_exit(weight__lock) }
            do {
                Product.weight_ = value
            }
        }
    }

    open var weight: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: Product.weight))
        }
        set(value) {
            setOptionalValue(for: Product.weight, to: DecimalValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var weightUnit: Property {
        get {
            objc_sync_enter(weightUnit__lock)
            defer { objc_sync_exit(weightUnit__lock) }
            do {
                return Product.weightUnit_
            }
        }
        set(value) {
            objc_sync_enter(weightUnit__lock)
            defer { objc_sync_exit(weightUnit__lock) }
            do {
                Product.weightUnit_ = value
            }
        }
    }

    open var weightUnit: String? {
        get {
            return StringValue.optional(optionalValue(for: Product.weightUnit))
        }
        set(value) {
            setOptionalValue(for: Product.weightUnit, to: StringValue.of(optional: value))
        }
    }
}
