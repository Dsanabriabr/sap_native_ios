// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

open class ProductCategory: EntityValue, Identifiable, @unchecked Sendable {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private nonisolated(unsafe) static let category__lock = ObjectBase()

    private nonisolated(unsafe) static var category_: Property = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "Category")

    private nonisolated(unsafe) static let categoryName__lock = ObjectBase()

    private nonisolated(unsafe) static var categoryName_: Property = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "CategoryName")

    private nonisolated(unsafe) static let mainCategory__lock = ObjectBase()

    private nonisolated(unsafe) static var mainCategory_: Property = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "MainCategory")

    private nonisolated(unsafe) static let mainCategoryName__lock = ObjectBase()

    private nonisolated(unsafe) static var mainCategoryName_: Property = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "MainCategoryName")

    private nonisolated(unsafe) static let numberOfProducts__lock = ObjectBase()

    private nonisolated(unsafe) static var numberOfProducts_: Property = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "NumberOfProducts")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: MyAppMDKDataMetadata.EntityTypes.productCategory, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [ProductCategory] {
        return ArrayConverter.convert(from.toArray(), [ProductCategory]())
    }

    @inline(__always)
    open class var category: Property {
        get {
            objc_sync_enter(category__lock)
            defer { objc_sync_exit(category__lock) }
            do {
                return ProductCategory.category_
            }
        }
        set(value) {
            objc_sync_enter(category__lock)
            defer { objc_sync_exit(category__lock) }
            do {
                ProductCategory.category_ = value
            }
        }
    }

    open var category: String? {
        get {
            return StringValue.optional(optionalValue(for: ProductCategory.category))
        }
        set(value) {
            setOptionalValue(for: ProductCategory.category, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var categoryName: Property {
        get {
            objc_sync_enter(categoryName__lock)
            defer { objc_sync_exit(categoryName__lock) }
            do {
                return ProductCategory.categoryName_
            }
        }
        set(value) {
            objc_sync_enter(categoryName__lock)
            defer { objc_sync_exit(categoryName__lock) }
            do {
                ProductCategory.categoryName_ = value
            }
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(optionalValue(for: ProductCategory.categoryName))
        }
        set(value) {
            setOptionalValue(for: ProductCategory.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> ProductCategory {
        return CastRequired<ProductCategory>.from(copyEntity())
    }

    override open var isProxy: Bool {
        return true
    }

    open class func key(category: String?) -> EntityKey {
        return EntityKey().with(name: "Category", value: StringValue.of(optional: category))
    }

    @inline(__always)
    open class var mainCategory: Property {
        get {
            objc_sync_enter(mainCategory__lock)
            defer { objc_sync_exit(mainCategory__lock) }
            do {
                return ProductCategory.mainCategory_
            }
        }
        set(value) {
            objc_sync_enter(mainCategory__lock)
            defer { objc_sync_exit(mainCategory__lock) }
            do {
                ProductCategory.mainCategory_ = value
            }
        }
    }

    open var mainCategory: String? {
        get {
            return StringValue.optional(optionalValue(for: ProductCategory.mainCategory))
        }
        set(value) {
            setOptionalValue(for: ProductCategory.mainCategory, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var mainCategoryName: Property {
        get {
            objc_sync_enter(mainCategoryName__lock)
            defer { objc_sync_exit(mainCategoryName__lock) }
            do {
                return ProductCategory.mainCategoryName_
            }
        }
        set(value) {
            objc_sync_enter(mainCategoryName__lock)
            defer { objc_sync_exit(mainCategoryName__lock) }
            do {
                ProductCategory.mainCategoryName_ = value
            }
        }
    }

    open var mainCategoryName: String? {
        get {
            return StringValue.optional(optionalValue(for: ProductCategory.mainCategoryName))
        }
        set(value) {
            setOptionalValue(for: ProductCategory.mainCategoryName, to: StringValue.of(optional: value))
        }
    }

    @inline(__always)
    open class var numberOfProducts: Property {
        get {
            objc_sync_enter(numberOfProducts__lock)
            defer { objc_sync_exit(numberOfProducts__lock) }
            do {
                return ProductCategory.numberOfProducts_
            }
        }
        set(value) {
            objc_sync_enter(numberOfProducts__lock)
            defer { objc_sync_exit(numberOfProducts__lock) }
            do {
                ProductCategory.numberOfProducts_ = value
            }
        }
    }

    open var numberOfProducts: Int64? {
        get {
            return LongValue.optional(optionalValue(for: ProductCategory.numberOfProducts))
        }
        set(value) {
            setOptionalValue(for: ProductCategory.numberOfProducts, to: LongValue.of(optional: value))
        }
    }

    open var old: ProductCategory {
        return CastRequired<ProductCategory>.from(oldEntity)
    }
}
