// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

class MyAppMDKDataFactory {
    static func registerAll() {
        MyAppMDKDataMetadata.ComplexTypes.address.registerFactory(ObjectFactory.with(create: { Address(withDefaults: false) }, createWithDecoder: { d in try Address(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.customer.registerFactory(ObjectFactory.with(create: { Customer(withDefaults: false) }, sparse: { m in Customer(withDefaults: false, withIndexMap: m) }, decode: { d in try Customer(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.product.registerFactory(ObjectFactory.with(create: { Product(withDefaults: false) }, sparse: { m in Product(withDefaults: false, withIndexMap: m) }, decode: { d in try Product(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.productCategory.registerFactory(ObjectFactory.with(create: { ProductCategory(withDefaults: false) }, sparse: { m in ProductCategory(withDefaults: false, withIndexMap: m) }, decode: { d in try ProductCategory(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.productText.registerFactory(ObjectFactory.with(create: { ProductText(withDefaults: false) }, sparse: { m in ProductText(withDefaults: false, withIndexMap: m) }, decode: { d in try ProductText(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.registerFactory(ObjectFactory.with(create: { PurchaseOrderHeader(withDefaults: false) }, sparse: { m in PurchaseOrderHeader(withDefaults: false, withIndexMap: m) }, decode: { d in try PurchaseOrderHeader(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.registerFactory(ObjectFactory.with(create: { PurchaseOrderItem(withDefaults: false) }, sparse: { m in PurchaseOrderItem(withDefaults: false, withIndexMap: m) }, decode: { d in try PurchaseOrderItem(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.registerFactory(ObjectFactory.with(create: { SalesOrderHeader(withDefaults: false) }, sparse: { m in SalesOrderHeader(withDefaults: false, withIndexMap: m) }, decode: { d in try SalesOrderHeader(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.salesOrderItem.registerFactory(ObjectFactory.with(create: { SalesOrderItem(withDefaults: false) }, sparse: { m in SalesOrderItem(withDefaults: false, withIndexMap: m) }, decode: { d in try SalesOrderItem(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.stock.registerFactory(ObjectFactory.with(create: { Stock(withDefaults: false) }, sparse: { m in Stock(withDefaults: false, withIndexMap: m) }, decode: { d in try Stock(from: d) }))
        MyAppMDKDataMetadata.EntityTypes.supplier.registerFactory(ObjectFactory.with(create: { Supplier(withDefaults: false) }, sparse: { m in Supplier(withDefaults: false, withIndexMap: m) }, decode: { d in try Supplier(from: d) }))
        MyAppMDKDataStaticResolver.resolve()
    }
}
