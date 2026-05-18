// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

public class MyAppMDKDataMetadata: @unchecked Sendable {
    private nonisolated(unsafe) static let document__lock = ObjectBase()

    private nonisolated(unsafe) static var document_: CSDLDocument = MyAppMDKDataMetadata.resolve()

    public static let lock: MetadataLock = xs_immortalize(MetadataLock())

    @inline(__always)
    public static var document: CSDLDocument {
        get {
            objc_sync_enter(document__lock)
            defer { objc_sync_exit(document__lock) }
            do {
                return MyAppMDKDataMetadata.document_
            }
        }
        set(value) {
            objc_sync_enter(document__lock)
            defer { objc_sync_exit(document__lock) }
            do {
                MyAppMDKDataMetadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        MyAppMDKDataFactory.registerAll()
        MyAppMDKDataMetadataParser.parsed.hasGeneratedProxies = true
        return MyAppMDKDataMetadataParser.parsed.immortalize()
    }

    public class EnumTypes: @unchecked Sendable {
        private nonisolated(unsafe) static let gender__lock = ObjectBase()

        private nonisolated(unsafe) static var gender_: EnumType = MyAppMDKDataMetadataParser.parsed.enumType(withName: "ESPM.Gender")

        @inline(__always)
        public static var gender: EnumType {
            get {
                objc_sync_enter(gender__lock)
                defer { objc_sync_exit(gender__lock) }
                do {
                    return MyAppMDKDataMetadata.EnumTypes.gender_
                }
            }
            set(value) {
                objc_sync_enter(gender__lock)
                defer { objc_sync_exit(gender__lock) }
                do {
                    MyAppMDKDataMetadata.EnumTypes.gender_ = value
                }
            }
        }
    }

    public class EnumValues {
        public class Gender: @unchecked Sendable {
            private nonisolated(unsafe) static let male__lock = ObjectBase()

            private nonisolated(unsafe) static var male_: EnumValue = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "Male")

            private nonisolated(unsafe) static let female__lock = ObjectBase()

            private nonisolated(unsafe) static var female_: EnumValue = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "Female")

            private nonisolated(unsafe) static let other__lock = ObjectBase()

            private nonisolated(unsafe) static var other_: EnumValue = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "Other")

            private nonisolated(unsafe) static let none__lock = ObjectBase()

            private nonisolated(unsafe) static var none_: EnumValue = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "None")

            private nonisolated(unsafe) static let unknown__lock = ObjectBase()

            private nonisolated(unsafe) static var unknown_: EnumValue = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "Unknown")

            @inline(__always)
            public static var female: EnumValue {
                get {
                    objc_sync_enter(female__lock)
                    defer { objc_sync_exit(female__lock) }
                    do {
                        return MyAppMDKDataMetadata.EnumValues.Gender.female_
                    }
                }
                set(value) {
                    objc_sync_enter(female__lock)
                    defer { objc_sync_exit(female__lock) }
                    do {
                        MyAppMDKDataMetadata.EnumValues.Gender.female_ = value
                    }
                }
            }

            @inline(__always)
            public static var male: EnumValue {
                get {
                    objc_sync_enter(male__lock)
                    defer { objc_sync_exit(male__lock) }
                    do {
                        return MyAppMDKDataMetadata.EnumValues.Gender.male_
                    }
                }
                set(value) {
                    objc_sync_enter(male__lock)
                    defer { objc_sync_exit(male__lock) }
                    do {
                        MyAppMDKDataMetadata.EnumValues.Gender.male_ = value
                    }
                }
            }

            @inline(__always)
            public static var none: EnumValue {
                get {
                    objc_sync_enter(none__lock)
                    defer { objc_sync_exit(none__lock) }
                    do {
                        return MyAppMDKDataMetadata.EnumValues.Gender.none_
                    }
                }
                set(value) {
                    objc_sync_enter(none__lock)
                    defer { objc_sync_exit(none__lock) }
                    do {
                        MyAppMDKDataMetadata.EnumValues.Gender.none_ = value
                    }
                }
            }

            @inline(__always)
            public static var other: EnumValue {
                get {
                    objc_sync_enter(other__lock)
                    defer { objc_sync_exit(other__lock) }
                    do {
                        return MyAppMDKDataMetadata.EnumValues.Gender.other_
                    }
                }
                set(value) {
                    objc_sync_enter(other__lock)
                    defer { objc_sync_exit(other__lock) }
                    do {
                        MyAppMDKDataMetadata.EnumValues.Gender.other_ = value
                    }
                }
            }

            @inline(__always)
            public static var unknown: EnumValue {
                get {
                    objc_sync_enter(unknown__lock)
                    defer { objc_sync_exit(unknown__lock) }
                    do {
                        return MyAppMDKDataMetadata.EnumValues.Gender.unknown_
                    }
                }
                set(value) {
                    objc_sync_enter(unknown__lock)
                    defer { objc_sync_exit(unknown__lock) }
                    do {
                        MyAppMDKDataMetadata.EnumValues.Gender.unknown_ = value
                    }
                }
            }
        }
    }

    public class ComplexTypes: @unchecked Sendable {
        private nonisolated(unsafe) static let address__lock = ObjectBase()

        private nonisolated(unsafe) static var address_: ComplexType = MyAppMDKDataMetadataParser.parsed.complexType(withName: "ESPM.Address")

        @inline(__always)
        public static var address: ComplexType {
            get {
                objc_sync_enter(address__lock)
                defer { objc_sync_exit(address__lock) }
                do {
                    return MyAppMDKDataMetadata.ComplexTypes.address_
                }
            }
            set(value) {
                objc_sync_enter(address__lock)
                defer { objc_sync_exit(address__lock) }
                do {
                    MyAppMDKDataMetadata.ComplexTypes.address_ = value
                }
            }
        }
    }

    public class EntityTypes: @unchecked Sendable {
        private nonisolated(unsafe) static let customer__lock = ObjectBase()

        private nonisolated(unsafe) static var customer_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.Customer")

        private nonisolated(unsafe) static let product__lock = ObjectBase()

        private nonisolated(unsafe) static var product_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.Product")

        private nonisolated(unsafe) static let productCategory__lock = ObjectBase()

        private nonisolated(unsafe) static var productCategory_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.ProductCategory")

        private nonisolated(unsafe) static let productText__lock = ObjectBase()

        private nonisolated(unsafe) static var productText_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.ProductText")

        private nonisolated(unsafe) static let purchaseOrderHeader__lock = ObjectBase()

        private nonisolated(unsafe) static var purchaseOrderHeader_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.PurchaseOrderHeader")

        private nonisolated(unsafe) static let purchaseOrderItem__lock = ObjectBase()

        private nonisolated(unsafe) static var purchaseOrderItem_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.PurchaseOrderItem")

        private nonisolated(unsafe) static let salesOrderHeader__lock = ObjectBase()

        private nonisolated(unsafe) static var salesOrderHeader_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.SalesOrderHeader")

        private nonisolated(unsafe) static let salesOrderItem__lock = ObjectBase()

        private nonisolated(unsafe) static var salesOrderItem_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.SalesOrderItem")

        private nonisolated(unsafe) static let stock__lock = ObjectBase()

        private nonisolated(unsafe) static var stock_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.Stock")

        private nonisolated(unsafe) static let supplier__lock = ObjectBase()

        private nonisolated(unsafe) static var supplier_: EntityType = MyAppMDKDataMetadataParser.parsed.entityType(withName: "ESPM.Supplier")

        @inline(__always)
        public static var customer: EntityType {
            get {
                objc_sync_enter(customer__lock)
                defer { objc_sync_exit(customer__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.customer_
                }
            }
            set(value) {
                objc_sync_enter(customer__lock)
                defer { objc_sync_exit(customer__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.customer_ = value
                }
            }
        }

        @inline(__always)
        public static var product: EntityType {
            get {
                objc_sync_enter(product__lock)
                defer { objc_sync_exit(product__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.product_
                }
            }
            set(value) {
                objc_sync_enter(product__lock)
                defer { objc_sync_exit(product__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.product_ = value
                }
            }
        }

        @inline(__always)
        public static var productCategory: EntityType {
            get {
                objc_sync_enter(productCategory__lock)
                defer { objc_sync_exit(productCategory__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.productCategory_
                }
            }
            set(value) {
                objc_sync_enter(productCategory__lock)
                defer { objc_sync_exit(productCategory__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.productCategory_ = value
                }
            }
        }

        @inline(__always)
        public static var productText: EntityType {
            get {
                objc_sync_enter(productText__lock)
                defer { objc_sync_exit(productText__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.productText_
                }
            }
            set(value) {
                objc_sync_enter(productText__lock)
                defer { objc_sync_exit(productText__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.productText_ = value
                }
            }
        }

        @inline(__always)
        public static var purchaseOrderHeader: EntityType {
            get {
                objc_sync_enter(purchaseOrderHeader__lock)
                defer { objc_sync_exit(purchaseOrderHeader__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader_
                }
            }
            set(value) {
                objc_sync_enter(purchaseOrderHeader__lock)
                defer { objc_sync_exit(purchaseOrderHeader__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader_ = value
                }
            }
        }

        @inline(__always)
        public static var purchaseOrderItem: EntityType {
            get {
                objc_sync_enter(purchaseOrderItem__lock)
                defer { objc_sync_exit(purchaseOrderItem__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem_
                }
            }
            set(value) {
                objc_sync_enter(purchaseOrderItem__lock)
                defer { objc_sync_exit(purchaseOrderItem__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem_ = value
                }
            }
        }

        @inline(__always)
        public static var salesOrderHeader: EntityType {
            get {
                objc_sync_enter(salesOrderHeader__lock)
                defer { objc_sync_exit(salesOrderHeader__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.salesOrderHeader_
                }
            }
            set(value) {
                objc_sync_enter(salesOrderHeader__lock)
                defer { objc_sync_exit(salesOrderHeader__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.salesOrderHeader_ = value
                }
            }
        }

        @inline(__always)
        public static var salesOrderItem: EntityType {
            get {
                objc_sync_enter(salesOrderItem__lock)
                defer { objc_sync_exit(salesOrderItem__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.salesOrderItem_
                }
            }
            set(value) {
                objc_sync_enter(salesOrderItem__lock)
                defer { objc_sync_exit(salesOrderItem__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.salesOrderItem_ = value
                }
            }
        }

        @inline(__always)
        public static var stock: EntityType {
            get {
                objc_sync_enter(stock__lock)
                defer { objc_sync_exit(stock__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.stock_
                }
            }
            set(value) {
                objc_sync_enter(stock__lock)
                defer { objc_sync_exit(stock__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.stock_ = value
                }
            }
        }

        @inline(__always)
        public static var supplier: EntityType {
            get {
                objc_sync_enter(supplier__lock)
                defer { objc_sync_exit(supplier__lock) }
                do {
                    return MyAppMDKDataMetadata.EntityTypes.supplier_
                }
            }
            set(value) {
                objc_sync_enter(supplier__lock)
                defer { objc_sync_exit(supplier__lock) }
                do {
                    MyAppMDKDataMetadata.EntityTypes.supplier_ = value
                }
            }
        }
    }

    public class EntitySets: @unchecked Sendable {
        private nonisolated(unsafe) static let customers__lock = ObjectBase()

        private nonisolated(unsafe) static var customers_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "Customers")

        private nonisolated(unsafe) static let productCategories__lock = ObjectBase()

        private nonisolated(unsafe) static var productCategories_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "ProductCategories")

        private nonisolated(unsafe) static let productTexts__lock = ObjectBase()

        private nonisolated(unsafe) static var productTexts_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "ProductTexts")

        private nonisolated(unsafe) static let products__lock = ObjectBase()

        private nonisolated(unsafe) static var products_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "Products")

        private nonisolated(unsafe) static let purchaseOrderHeaders__lock = ObjectBase()

        private nonisolated(unsafe) static var purchaseOrderHeaders_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "PurchaseOrderHeaders")

        private nonisolated(unsafe) static let purchaseOrderItems__lock = ObjectBase()

        private nonisolated(unsafe) static var purchaseOrderItems_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "PurchaseOrderItems")

        private nonisolated(unsafe) static let salesOrderHeaders__lock = ObjectBase()

        private nonisolated(unsafe) static var salesOrderHeaders_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "SalesOrderHeaders")

        private nonisolated(unsafe) static let salesOrderItems__lock = ObjectBase()

        private nonisolated(unsafe) static var salesOrderItems_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "SalesOrderItems")

        private nonisolated(unsafe) static let stock__lock = ObjectBase()

        private nonisolated(unsafe) static var stock_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "Stock")

        private nonisolated(unsafe) static let suppliers__lock = ObjectBase()

        private nonisolated(unsafe) static var suppliers_: EntitySet = MyAppMDKDataMetadataParser.parsed.entitySet(withName: "Suppliers")

        @inline(__always)
        public static var customers: EntitySet {
            get {
                objc_sync_enter(customers__lock)
                defer { objc_sync_exit(customers__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.customers_
                }
            }
            set(value) {
                objc_sync_enter(customers__lock)
                defer { objc_sync_exit(customers__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.customers_ = value
                }
            }
        }

        @inline(__always)
        public static var productCategories: EntitySet {
            get {
                objc_sync_enter(productCategories__lock)
                defer { objc_sync_exit(productCategories__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.productCategories_
                }
            }
            set(value) {
                objc_sync_enter(productCategories__lock)
                defer { objc_sync_exit(productCategories__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.productCategories_ = value
                }
            }
        }

        @inline(__always)
        public static var productTexts: EntitySet {
            get {
                objc_sync_enter(productTexts__lock)
                defer { objc_sync_exit(productTexts__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.productTexts_
                }
            }
            set(value) {
                objc_sync_enter(productTexts__lock)
                defer { objc_sync_exit(productTexts__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.productTexts_ = value
                }
            }
        }

        @inline(__always)
        public static var products: EntitySet {
            get {
                objc_sync_enter(products__lock)
                defer { objc_sync_exit(products__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.products_
                }
            }
            set(value) {
                objc_sync_enter(products__lock)
                defer { objc_sync_exit(products__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.products_ = value
                }
            }
        }

        @inline(__always)
        public static var purchaseOrderHeaders: EntitySet {
            get {
                objc_sync_enter(purchaseOrderHeaders__lock)
                defer { objc_sync_exit(purchaseOrderHeaders__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders_
                }
            }
            set(value) {
                objc_sync_enter(purchaseOrderHeaders__lock)
                defer { objc_sync_exit(purchaseOrderHeaders__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders_ = value
                }
            }
        }

        @inline(__always)
        public static var purchaseOrderItems: EntitySet {
            get {
                objc_sync_enter(purchaseOrderItems__lock)
                defer { objc_sync_exit(purchaseOrderItems__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.purchaseOrderItems_
                }
            }
            set(value) {
                objc_sync_enter(purchaseOrderItems__lock)
                defer { objc_sync_exit(purchaseOrderItems__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.purchaseOrderItems_ = value
                }
            }
        }

        @inline(__always)
        public static var salesOrderHeaders: EntitySet {
            get {
                objc_sync_enter(salesOrderHeaders__lock)
                defer { objc_sync_exit(salesOrderHeaders__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.salesOrderHeaders_
                }
            }
            set(value) {
                objc_sync_enter(salesOrderHeaders__lock)
                defer { objc_sync_exit(salesOrderHeaders__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.salesOrderHeaders_ = value
                }
            }
        }

        @inline(__always)
        public static var salesOrderItems: EntitySet {
            get {
                objc_sync_enter(salesOrderItems__lock)
                defer { objc_sync_exit(salesOrderItems__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.salesOrderItems_
                }
            }
            set(value) {
                objc_sync_enter(salesOrderItems__lock)
                defer { objc_sync_exit(salesOrderItems__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.salesOrderItems_ = value
                }
            }
        }

        @inline(__always)
        public static var stock: EntitySet {
            get {
                objc_sync_enter(stock__lock)
                defer { objc_sync_exit(stock__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.stock_
                }
            }
            set(value) {
                objc_sync_enter(stock__lock)
                defer { objc_sync_exit(stock__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.stock_ = value
                }
            }
        }

        @inline(__always)
        public static var suppliers: EntitySet {
            get {
                objc_sync_enter(suppliers__lock)
                defer { objc_sync_exit(suppliers__lock) }
                do {
                    return MyAppMDKDataMetadata.EntitySets.suppliers_
                }
            }
            set(value) {
                objc_sync_enter(suppliers__lock)
                defer { objc_sync_exit(suppliers__lock) }
                do {
                    MyAppMDKDataMetadata.EntitySets.suppliers_ = value
                }
            }
        }
    }

    public class Actions: @unchecked Sendable {
        private nonisolated(unsafe) static let generateSamplePurchaseOrders__lock = ObjectBase()

        private nonisolated(unsafe) static var generateSamplePurchaseOrders_: DataMethod = MyAppMDKDataMetadataParser.parsed.dataMethod(withName: "ESPM.GenerateSamplePurchaseOrders")

        private nonisolated(unsafe) static let generateSampleSalesOrders__lock = ObjectBase()

        private nonisolated(unsafe) static var generateSampleSalesOrders_: DataMethod = MyAppMDKDataMetadataParser.parsed.dataMethod(withName: "ESPM.GenerateSampleSalesOrders")

        private nonisolated(unsafe) static let resetSampleData__lock = ObjectBase()

        private nonisolated(unsafe) static var resetSampleData_: DataMethod = MyAppMDKDataMetadataParser.parsed.dataMethod(withName: "ESPM.ResetSampleData")

        private nonisolated(unsafe) static let updateSalesOrderStatus__lock = ObjectBase()

        private nonisolated(unsafe) static var updateSalesOrderStatus_: DataMethod = MyAppMDKDataMetadataParser.parsed.dataMethod(withName: "ESPM.UpdateSalesOrderStatus")

        @inline(__always)
        public static var generateSamplePurchaseOrders: DataMethod {
            get {
                objc_sync_enter(generateSamplePurchaseOrders__lock)
                defer { objc_sync_exit(generateSamplePurchaseOrders__lock) }
                do {
                    return MyAppMDKDataMetadata.Actions.generateSamplePurchaseOrders_
                }
            }
            set(value) {
                objc_sync_enter(generateSamplePurchaseOrders__lock)
                defer { objc_sync_exit(generateSamplePurchaseOrders__lock) }
                do {
                    MyAppMDKDataMetadata.Actions.generateSamplePurchaseOrders_ = value
                }
            }
        }

        @inline(__always)
        public static var generateSampleSalesOrders: DataMethod {
            get {
                objc_sync_enter(generateSampleSalesOrders__lock)
                defer { objc_sync_exit(generateSampleSalesOrders__lock) }
                do {
                    return MyAppMDKDataMetadata.Actions.generateSampleSalesOrders_
                }
            }
            set(value) {
                objc_sync_enter(generateSampleSalesOrders__lock)
                defer { objc_sync_exit(generateSampleSalesOrders__lock) }
                do {
                    MyAppMDKDataMetadata.Actions.generateSampleSalesOrders_ = value
                }
            }
        }

        @inline(__always)
        public static var resetSampleData: DataMethod {
            get {
                objc_sync_enter(resetSampleData__lock)
                defer { objc_sync_exit(resetSampleData__lock) }
                do {
                    return MyAppMDKDataMetadata.Actions.resetSampleData_
                }
            }
            set(value) {
                objc_sync_enter(resetSampleData__lock)
                defer { objc_sync_exit(resetSampleData__lock) }
                do {
                    MyAppMDKDataMetadata.Actions.resetSampleData_ = value
                }
            }
        }

        @inline(__always)
        public static var updateSalesOrderStatus: DataMethod {
            get {
                objc_sync_enter(updateSalesOrderStatus__lock)
                defer { objc_sync_exit(updateSalesOrderStatus__lock) }
                do {
                    return MyAppMDKDataMetadata.Actions.updateSalesOrderStatus_
                }
            }
            set(value) {
                objc_sync_enter(updateSalesOrderStatus__lock)
                defer { objc_sync_exit(updateSalesOrderStatus__lock) }
                do {
                    MyAppMDKDataMetadata.Actions.updateSalesOrderStatus_ = value
                }
            }
        }
    }

    public class ActionImports: @unchecked Sendable {
        private nonisolated(unsafe) static let generateSamplePurchaseOrders__lock = ObjectBase()

        private nonisolated(unsafe) static var generateSamplePurchaseOrders_: DataMethod = MyAppMDKDataMetadataParser.parsed.dataMethod(withName: "GenerateSamplePurchaseOrders")

        private nonisolated(unsafe) static let generateSampleSalesOrders__lock = ObjectBase()

        private nonisolated(unsafe) static var generateSampleSalesOrders_: DataMethod = MyAppMDKDataMetadataParser.parsed.dataMethod(withName: "GenerateSampleSalesOrders")

        private nonisolated(unsafe) static let resetSampleData__lock = ObjectBase()

        private nonisolated(unsafe) static var resetSampleData_: DataMethod = MyAppMDKDataMetadataParser.parsed.dataMethod(withName: "ResetSampleData")

        private nonisolated(unsafe) static let updateSalesOrderStatus__lock = ObjectBase()

        private nonisolated(unsafe) static var updateSalesOrderStatus_: DataMethod = MyAppMDKDataMetadataParser.parsed.dataMethod(withName: "UpdateSalesOrderStatus")

        @inline(__always)
        public static var generateSamplePurchaseOrders: DataMethod {
            get {
                objc_sync_enter(generateSamplePurchaseOrders__lock)
                defer { objc_sync_exit(generateSamplePurchaseOrders__lock) }
                do {
                    return MyAppMDKDataMetadata.ActionImports.generateSamplePurchaseOrders_
                }
            }
            set(value) {
                objc_sync_enter(generateSamplePurchaseOrders__lock)
                defer { objc_sync_exit(generateSamplePurchaseOrders__lock) }
                do {
                    MyAppMDKDataMetadata.ActionImports.generateSamplePurchaseOrders_ = value
                }
            }
        }

        @inline(__always)
        public static var generateSampleSalesOrders: DataMethod {
            get {
                objc_sync_enter(generateSampleSalesOrders__lock)
                defer { objc_sync_exit(generateSampleSalesOrders__lock) }
                do {
                    return MyAppMDKDataMetadata.ActionImports.generateSampleSalesOrders_
                }
            }
            set(value) {
                objc_sync_enter(generateSampleSalesOrders__lock)
                defer { objc_sync_exit(generateSampleSalesOrders__lock) }
                do {
                    MyAppMDKDataMetadata.ActionImports.generateSampleSalesOrders_ = value
                }
            }
        }

        @inline(__always)
        public static var resetSampleData: DataMethod {
            get {
                objc_sync_enter(resetSampleData__lock)
                defer { objc_sync_exit(resetSampleData__lock) }
                do {
                    return MyAppMDKDataMetadata.ActionImports.resetSampleData_
                }
            }
            set(value) {
                objc_sync_enter(resetSampleData__lock)
                defer { objc_sync_exit(resetSampleData__lock) }
                do {
                    MyAppMDKDataMetadata.ActionImports.resetSampleData_ = value
                }
            }
        }

        @inline(__always)
        public static var updateSalesOrderStatus: DataMethod {
            get {
                objc_sync_enter(updateSalesOrderStatus__lock)
                defer { objc_sync_exit(updateSalesOrderStatus__lock) }
                do {
                    return MyAppMDKDataMetadata.ActionImports.updateSalesOrderStatus_
                }
            }
            set(value) {
                objc_sync_enter(updateSalesOrderStatus__lock)
                defer { objc_sync_exit(updateSalesOrderStatus__lock) }
                do {
                    MyAppMDKDataMetadata.ActionImports.updateSalesOrderStatus_ = value
                }
            }
        }
    }
}
