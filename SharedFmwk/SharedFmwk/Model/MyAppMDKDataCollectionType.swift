//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import Foundation

public enum MyAppMDKDataCollectionType: CaseIterable {
    case salesOrderHeaders
    case products
    case productTexts
    case customers
    case stock
    case purchaseOrderHeaders
    case salesOrderItems
    case productCategories
    case purchaseOrderItems
    case suppliers

    public init?(rawValue: String) {
        guard let type = MyAppMDKDataCollectionType.allCases.first(where: { rawValue == $0.description }) else {
            return nil
        }
        self = type
    }

    public var description: String {
        switch self {
        case .salesOrderHeaders: return "SalesOrderHeaders"
        case .products: return "Products"
        case .productTexts: return "ProductTexts"
        case .customers: return "Customers"
        case .stock: return "Stock"
        case .purchaseOrderHeaders: return "PurchaseOrderHeaders"
        case .salesOrderItems: return "SalesOrderItems"
        case .productCategories: return "ProductCategories"
        case .purchaseOrderItems: return "PurchaseOrderItems"
        case .suppliers: return "Suppliers"
        }
    }
}
