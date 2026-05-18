// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

class MyAppMDKDataMetadataChanges {
    static func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        MyAppMDKDataMetadata.document = metadata
        MyAppMDKDataMetadataChanges.merge1(metadata: metadata)
        MyAppMDKDataFactory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) {
        _ = metadata
        if !MyAppMDKDataMetadata.EnumTypes.gender.isRemoved {
            MyAppMDKDataMetadata.EnumTypes.gender = metadata.enumType(withName: "ESPM.Gender")
        }
        if !MyAppMDKDataMetadata.EnumValues.Gender.male.isRemoved {
            MyAppMDKDataMetadata.EnumValues.Gender.male = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "Male")
        }
        if !MyAppMDKDataMetadata.EnumValues.Gender.female.isRemoved {
            MyAppMDKDataMetadata.EnumValues.Gender.female = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "Female")
        }
        if !MyAppMDKDataMetadata.EnumValues.Gender.other.isRemoved {
            MyAppMDKDataMetadata.EnumValues.Gender.other = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "Other")
        }
        if !MyAppMDKDataMetadata.EnumValues.Gender.none.isRemoved {
            MyAppMDKDataMetadata.EnumValues.Gender.none = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "None")
        }
        if !MyAppMDKDataMetadata.EnumValues.Gender.unknown.isRemoved {
            MyAppMDKDataMetadata.EnumValues.Gender.unknown = MyAppMDKDataMetadata.EnumTypes.gender.member(name: "Unknown")
        }
        if !MyAppMDKDataMetadata.ComplexTypes.address.isRemoved {
            MyAppMDKDataMetadata.ComplexTypes.address = metadata.complexType(withName: "ESPM.Address")
        }
        if !MyAppMDKDataMetadata.EntityTypes.customer.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.customer = metadata.entityType(withName: "ESPM.Customer")
        }
        if !MyAppMDKDataMetadata.EntityTypes.product.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.product = metadata.entityType(withName: "ESPM.Product")
        }
        if !MyAppMDKDataMetadata.EntityTypes.productCategory.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.productCategory = metadata.entityType(withName: "ESPM.ProductCategory")
        }
        if !MyAppMDKDataMetadata.EntityTypes.productText.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.productText = metadata.entityType(withName: "ESPM.ProductText")
        }
        if !MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader = metadata.entityType(withName: "ESPM.PurchaseOrderHeader")
        }
        if !MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem = metadata.entityType(withName: "ESPM.PurchaseOrderItem")
        }
        if !MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.salesOrderHeader = metadata.entityType(withName: "ESPM.SalesOrderHeader")
        }
        if !MyAppMDKDataMetadata.EntityTypes.salesOrderItem.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.salesOrderItem = metadata.entityType(withName: "ESPM.SalesOrderItem")
        }
        if !MyAppMDKDataMetadata.EntityTypes.stock.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.stock = metadata.entityType(withName: "ESPM.Stock")
        }
        if !MyAppMDKDataMetadata.EntityTypes.supplier.isRemoved {
            MyAppMDKDataMetadata.EntityTypes.supplier = metadata.entityType(withName: "ESPM.Supplier")
        }
        if !MyAppMDKDataMetadata.EntitySets.customers.isRemoved {
            MyAppMDKDataMetadata.EntitySets.customers = metadata.entitySet(withName: "Customers")
        }
        if !MyAppMDKDataMetadata.EntitySets.productCategories.isRemoved {
            MyAppMDKDataMetadata.EntitySets.productCategories = metadata.entitySet(withName: "ProductCategories")
        }
        if !MyAppMDKDataMetadata.EntitySets.productTexts.isRemoved {
            MyAppMDKDataMetadata.EntitySets.productTexts = metadata.entitySet(withName: "ProductTexts")
        }
        if !MyAppMDKDataMetadata.EntitySets.products.isRemoved {
            MyAppMDKDataMetadata.EntitySets.products = metadata.entitySet(withName: "Products")
        }
        if !MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders.isRemoved {
            MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders = metadata.entitySet(withName: "PurchaseOrderHeaders")
        }
        if !MyAppMDKDataMetadata.EntitySets.purchaseOrderItems.isRemoved {
            MyAppMDKDataMetadata.EntitySets.purchaseOrderItems = metadata.entitySet(withName: "PurchaseOrderItems")
        }
        if !MyAppMDKDataMetadata.EntitySets.salesOrderHeaders.isRemoved {
            MyAppMDKDataMetadata.EntitySets.salesOrderHeaders = metadata.entitySet(withName: "SalesOrderHeaders")
        }
        if !MyAppMDKDataMetadata.EntitySets.salesOrderItems.isRemoved {
            MyAppMDKDataMetadata.EntitySets.salesOrderItems = metadata.entitySet(withName: "SalesOrderItems")
        }
        if !MyAppMDKDataMetadata.EntitySets.stock.isRemoved {
            MyAppMDKDataMetadata.EntitySets.stock = metadata.entitySet(withName: "Stock")
        }
        if !MyAppMDKDataMetadata.EntitySets.suppliers.isRemoved {
            MyAppMDKDataMetadata.EntitySets.suppliers = metadata.entitySet(withName: "Suppliers")
        }
        if !MyAppMDKDataMetadata.Actions.generateSamplePurchaseOrders.isRemoved {
            MyAppMDKDataMetadata.Actions.generateSamplePurchaseOrders = metadata.dataMethod(withName: "ESPM.GenerateSamplePurchaseOrders")
        }
        if !MyAppMDKDataMetadata.Actions.generateSampleSalesOrders.isRemoved {
            MyAppMDKDataMetadata.Actions.generateSampleSalesOrders = metadata.dataMethod(withName: "ESPM.GenerateSampleSalesOrders")
        }
        if !MyAppMDKDataMetadata.Actions.resetSampleData.isRemoved {
            MyAppMDKDataMetadata.Actions.resetSampleData = metadata.dataMethod(withName: "ESPM.ResetSampleData")
        }
        if !MyAppMDKDataMetadata.Actions.updateSalesOrderStatus.isRemoved {
            MyAppMDKDataMetadata.Actions.updateSalesOrderStatus = metadata.dataMethod(withName: "ESPM.UpdateSalesOrderStatus")
        }
        if !MyAppMDKDataMetadata.ActionImports.generateSamplePurchaseOrders.isRemoved {
            MyAppMDKDataMetadata.ActionImports.generateSamplePurchaseOrders = metadata.dataMethod(withName: "GenerateSamplePurchaseOrders")
        }
        if !MyAppMDKDataMetadata.ActionImports.generateSampleSalesOrders.isRemoved {
            MyAppMDKDataMetadata.ActionImports.generateSampleSalesOrders = metadata.dataMethod(withName: "GenerateSampleSalesOrders")
        }
        if !MyAppMDKDataMetadata.ActionImports.resetSampleData.isRemoved {
            MyAppMDKDataMetadata.ActionImports.resetSampleData = metadata.dataMethod(withName: "ResetSampleData")
        }
        if !MyAppMDKDataMetadata.ActionImports.updateSalesOrderStatus.isRemoved {
            MyAppMDKDataMetadata.ActionImports.updateSalesOrderStatus = metadata.dataMethod(withName: "UpdateSalesOrderStatus")
        }
        MyAppMDKData.customers = MyAppMDKDataMetadata.EntitySets.customers
        MyAppMDKData.productCategories = MyAppMDKDataMetadata.EntitySets.productCategories
        MyAppMDKData.productTexts = MyAppMDKDataMetadata.EntitySets.productTexts
        MyAppMDKData.products = MyAppMDKDataMetadata.EntitySets.products
        MyAppMDKData.purchaseOrderHeaders = MyAppMDKDataMetadata.EntitySets.purchaseOrderHeaders
        MyAppMDKData.purchaseOrderItems = MyAppMDKDataMetadata.EntitySets.purchaseOrderItems
        MyAppMDKData.salesOrderHeaders = MyAppMDKDataMetadata.EntitySets.salesOrderHeaders
        MyAppMDKData.salesOrderItems = MyAppMDKDataMetadata.EntitySets.salesOrderItems
        MyAppMDKData.stock = MyAppMDKDataMetadata.EntitySets.stock
        MyAppMDKData.suppliers = MyAppMDKDataMetadata.EntitySets.suppliers
        if !Address.houseNumber.isRemoved {
            Address.houseNumber = MyAppMDKDataMetadata.ComplexTypes.address.property(withName: "HouseNumber")
        }
        if !Address.street.isRemoved {
            Address.street = MyAppMDKDataMetadata.ComplexTypes.address.property(withName: "Street")
        }
        if !Address.city.isRemoved {
            Address.city = MyAppMDKDataMetadata.ComplexTypes.address.property(withName: "City")
        }
        if !Address.country.isRemoved {
            Address.country = MyAppMDKDataMetadata.ComplexTypes.address.property(withName: "Country")
        }
        if !Address.postalCode.isRemoved {
            Address.postalCode = MyAppMDKDataMetadata.ComplexTypes.address.property(withName: "PostalCode")
        }
        if !Customer.city.isRemoved {
            Customer.city = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "City")
        }
        if !Customer.country.isRemoved {
            Customer.country = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "Country")
        }
        if !Customer.customerID.isRemoved {
            Customer.customerID = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "CustomerID")
        }
        if !Customer.dateOfBirth.isRemoved {
            Customer.dateOfBirth = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "DateOfBirth")
        }
        if !Customer.emailAddress.isRemoved {
            Customer.emailAddress = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "EmailAddress")
        }
        if !Customer.gender.isRemoved {
            Customer.gender = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "Gender")
        }
        if !Customer.firstName.isRemoved {
            Customer.firstName = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "FirstName")
        }
        if !Customer.houseNumber.isRemoved {
            Customer.houseNumber = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "HouseNumber")
        }
        if !Customer.lastName.isRemoved {
            Customer.lastName = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "LastName")
        }
        if !Customer.phoneNumber.isRemoved {
            Customer.phoneNumber = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "PhoneNumber")
        }
        if !Customer.postalCode.isRemoved {
            Customer.postalCode = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "PostalCode")
        }
        if !Customer.street.isRemoved {
            Customer.street = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "Street")
        }
        if !Customer.address.isRemoved {
            Customer.address = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "Address")
        }
        if !Customer.salesOrders.isRemoved {
            Customer.salesOrders = MyAppMDKDataMetadata.EntityTypes.customer.property(withName: "SalesOrders")
        }
        if !Product.category.isRemoved {
            Product.category = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Category")
        }
        if !Product.categoryName.isRemoved {
            Product.categoryName = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "CategoryName")
        }
        if !Product.currencyCode.isRemoved {
            Product.currencyCode = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "CurrencyCode")
        }
        if !Product.dimensionDepth.isRemoved {
            Product.dimensionDepth = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "DimensionDepth")
        }
        if !Product.dimensionHeight.isRemoved {
            Product.dimensionHeight = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "DimensionHeight")
        }
        if !Product.dimensionUnit.isRemoved {
            Product.dimensionUnit = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "DimensionUnit")
        }
        if !Product.dimensionWidth.isRemoved {
            Product.dimensionWidth = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "DimensionWidth")
        }
        if !Product.longDescription.isRemoved {
            Product.longDescription = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "LongDescription")
        }
        if !Product.name.isRemoved {
            Product.name = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Name")
        }
        if !Product.pictureUrl.isRemoved {
            Product.pictureUrl = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "PictureUrl")
        }
        if !Product.price.isRemoved {
            Product.price = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Price")
        }
        if !Product.productID.isRemoved {
            Product.productID = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "ProductID")
        }
        if !Product.quantityUnit.isRemoved {
            Product.quantityUnit = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "QuantityUnit")
        }
        if !Product.shortDescription.isRemoved {
            Product.shortDescription = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "ShortDescription")
        }
        if !Product.supplierID.isRemoved {
            Product.supplierID = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "SupplierID")
        }
        if !Product.weight.isRemoved {
            Product.weight = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Weight")
        }
        if !Product.weightUnit.isRemoved {
            Product.weightUnit = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "WeightUnit")
        }
        if !Product.picture.isRemoved {
            Product.picture = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Picture")
        }
        if !Product.supplier.isRemoved {
            Product.supplier = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Supplier")
        }
        if !Product.stock.isRemoved {
            Product.stock = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "Stock")
        }
        if !Product.purchaseOrderItems.isRemoved {
            Product.purchaseOrderItems = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "PurchaseOrderItems")
        }
        if !Product.salesOrderItems.isRemoved {
            Product.salesOrderItems = MyAppMDKDataMetadata.EntityTypes.product.property(withName: "SalesOrderItems")
        }
        if !ProductCategory.category.isRemoved {
            ProductCategory.category = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "Category")
        }
        if !ProductCategory.categoryName.isRemoved {
            ProductCategory.categoryName = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "CategoryName")
        }
        if !ProductCategory.mainCategory.isRemoved {
            ProductCategory.mainCategory = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "MainCategory")
        }
        if !ProductCategory.mainCategoryName.isRemoved {
            ProductCategory.mainCategoryName = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "MainCategoryName")
        }
        if !ProductCategory.numberOfProducts.isRemoved {
            ProductCategory.numberOfProducts = MyAppMDKDataMetadata.EntityTypes.productCategory.property(withName: "NumberOfProducts")
        }
        if !ProductText.keyID.isRemoved {
            ProductText.keyID = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "ID")
        }
        if !ProductText.language.isRemoved {
            ProductText.language = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "Language")
        }
        if !ProductText.longDescription.isRemoved {
            ProductText.longDescription = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "LongDescription")
        }
        if !ProductText.name.isRemoved {
            ProductText.name = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "Name")
        }
        if !ProductText.productID.isRemoved {
            ProductText.productID = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "ProductID")
        }
        if !ProductText.shortDescription.isRemoved {
            ProductText.shortDescription = MyAppMDKDataMetadata.EntityTypes.productText.property(withName: "ShortDescription")
        }
        if !PurchaseOrderHeader.currencyCode.isRemoved {
            PurchaseOrderHeader.currencyCode = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "CurrencyCode")
        }
        if !PurchaseOrderHeader.grossAmount.isRemoved {
            PurchaseOrderHeader.grossAmount = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "GrossAmount")
        }
        if !PurchaseOrderHeader.netAmount.isRemoved {
            PurchaseOrderHeader.netAmount = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "NetAmount")
        }
        if !PurchaseOrderHeader.purchaseOrderID.isRemoved {
            PurchaseOrderHeader.purchaseOrderID = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "PurchaseOrderID")
        }
        if !PurchaseOrderHeader.supplierID.isRemoved {
            PurchaseOrderHeader.supplierID = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "SupplierID")
        }
        if !PurchaseOrderHeader.taxAmount.isRemoved {
            PurchaseOrderHeader.taxAmount = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "TaxAmount")
        }
        if !PurchaseOrderHeader.supplier.isRemoved {
            PurchaseOrderHeader.supplier = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Supplier")
        }
        if !PurchaseOrderHeader.items.isRemoved {
            PurchaseOrderHeader.items = MyAppMDKDataMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Items")
        }
        if !PurchaseOrderItem.currencyCode.isRemoved {
            PurchaseOrderItem.currencyCode = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "CurrencyCode")
        }
        if !PurchaseOrderItem.grossAmount.isRemoved {
            PurchaseOrderItem.grossAmount = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmount")
        }
        if !PurchaseOrderItem.itemNumber.isRemoved {
            PurchaseOrderItem.itemNumber = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "ItemNumber")
        }
        if !PurchaseOrderItem.netAmount.isRemoved {
            PurchaseOrderItem.netAmount = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "NetAmount")
        }
        if !PurchaseOrderItem.productID.isRemoved {
            PurchaseOrderItem.productID = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductID")
        }
        if !PurchaseOrderItem.purchaseOrderID.isRemoved {
            PurchaseOrderItem.purchaseOrderID = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "PurchaseOrderID")
        }
        if !PurchaseOrderItem.quantity.isRemoved {
            PurchaseOrderItem.quantity = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "Quantity")
        }
        if !PurchaseOrderItem.quantityUnit.isRemoved {
            PurchaseOrderItem.quantityUnit = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "QuantityUnit")
        }
        if !PurchaseOrderItem.taxAmount.isRemoved {
            PurchaseOrderItem.taxAmount = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "TaxAmount")
        }
        if !PurchaseOrderItem.product.isRemoved {
            PurchaseOrderItem.product = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "Product")
        }
        if !PurchaseOrderItem.header.isRemoved {
            PurchaseOrderItem.header = MyAppMDKDataMetadata.EntityTypes.purchaseOrderItem.property(withName: "Header")
        }
        if !SalesOrderHeader.createdAt.isRemoved {
            SalesOrderHeader.createdAt = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "CreatedAt")
        }
        if !SalesOrderHeader.currencyCode.isRemoved {
            SalesOrderHeader.currencyCode = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "CurrencyCode")
        }
        if !SalesOrderHeader.customerID.isRemoved {
            SalesOrderHeader.customerID = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerID")
        }
        if !SalesOrderHeader.grossAmount.isRemoved {
            SalesOrderHeader.grossAmount = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "GrossAmount")
        }
        if !SalesOrderHeader.lifeCycleStatus.isRemoved {
            SalesOrderHeader.lifeCycleStatus = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatus")
        }
        if !SalesOrderHeader.lifeCycleStatusName.isRemoved {
            SalesOrderHeader.lifeCycleStatusName = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatusName")
        }
        if !SalesOrderHeader.netAmount.isRemoved {
            SalesOrderHeader.netAmount = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "NetAmount")
        }
        if !SalesOrderHeader.salesOrderID.isRemoved {
            SalesOrderHeader.salesOrderID = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "SalesOrderID")
        }
        if !SalesOrderHeader.taxAmount.isRemoved {
            SalesOrderHeader.taxAmount = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "TaxAmount")
        }
        if !SalesOrderHeader.customer.isRemoved {
            SalesOrderHeader.customer = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "Customer")
        }
        if !SalesOrderHeader.items.isRemoved {
            SalesOrderHeader.items = MyAppMDKDataMetadata.EntityTypes.salesOrderHeader.property(withName: "Items")
        }
        if !SalesOrderItem.currencyCode.isRemoved {
            SalesOrderItem.currencyCode = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "CurrencyCode")
        }
        if !SalesOrderItem.deliveryDate.isRemoved {
            SalesOrderItem.deliveryDate = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "DeliveryDate")
        }
        if !SalesOrderItem.grossAmount.isRemoved {
            SalesOrderItem.grossAmount = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "GrossAmount")
        }
        if !SalesOrderItem.itemNumber.isRemoved {
            SalesOrderItem.itemNumber = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "ItemNumber")
        }
        if !SalesOrderItem.netAmount.isRemoved {
            SalesOrderItem.netAmount = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "NetAmount")
        }
        if !SalesOrderItem.productID.isRemoved {
            SalesOrderItem.productID = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "ProductID")
        }
        if !SalesOrderItem.quantity.isRemoved {
            SalesOrderItem.quantity = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "Quantity")
        }
        if !SalesOrderItem.quantityUnit.isRemoved {
            SalesOrderItem.quantityUnit = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "QuantityUnit")
        }
        if !SalesOrderItem.salesOrderID.isRemoved {
            SalesOrderItem.salesOrderID = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "SalesOrderID")
        }
        if !SalesOrderItem.taxAmount.isRemoved {
            SalesOrderItem.taxAmount = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "TaxAmount")
        }
        if !SalesOrderItem.product.isRemoved {
            SalesOrderItem.product = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "Product")
        }
        if !SalesOrderItem.header.isRemoved {
            SalesOrderItem.header = MyAppMDKDataMetadata.EntityTypes.salesOrderItem.property(withName: "Header")
        }
        if !Stock.lotSize.isRemoved {
            Stock.lotSize = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "LotSize")
        }
        if !Stock.minStock.isRemoved {
            Stock.minStock = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "MinStock")
        }
        if !Stock.productID.isRemoved {
            Stock.productID = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "ProductID")
        }
        if !Stock.quantity.isRemoved {
            Stock.quantity = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "Quantity")
        }
        if !Stock.quantityLessMin.isRemoved {
            Stock.quantityLessMin = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "QuantityLessMin")
        }
        if !Stock.product.isRemoved {
            Stock.product = MyAppMDKDataMetadata.EntityTypes.stock.property(withName: "Product")
        }
        if !Supplier.city.isRemoved {
            Supplier.city = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "City")
        }
        if !Supplier.country.isRemoved {
            Supplier.country = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "Country")
        }
        if !Supplier.emailAddress.isRemoved {
            Supplier.emailAddress = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "EmailAddress")
        }
        if !Supplier.houseNumber.isRemoved {
            Supplier.houseNumber = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "HouseNumber")
        }
        if !Supplier.phoneNumber.isRemoved {
            Supplier.phoneNumber = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "PhoneNumber")
        }
        if !Supplier.postalCode.isRemoved {
            Supplier.postalCode = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "PostalCode")
        }
        if !Supplier.street.isRemoved {
            Supplier.street = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "Street")
        }
        if !Supplier.supplierID.isRemoved {
            Supplier.supplierID = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "SupplierID")
        }
        if !Supplier.supplierName.isRemoved {
            Supplier.supplierName = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "SupplierName")
        }
        if !Supplier.address.isRemoved {
            Supplier.address = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "Address")
        }
        if !Supplier.products.isRemoved {
            Supplier.products = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "Products")
        }
        if !Supplier.purchaseOrders.isRemoved {
            Supplier.purchaseOrders = MyAppMDKDataMetadata.EntityTypes.supplier.property(withName: "PurchaseOrders")
        }
    }
}
