// # Proxy Compiler 26.3.0

import Foundation
import SAPOData

class MyAppMDKDataMetadataParser: @unchecked Sendable {
    static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.ignoreUndefinedTerms)

    static let parsed: CSDLDocument = xs_immortalize(MyAppMDKDataMetadataParser.parse())

    static func parse() -> CSDLDocument {
        let parser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = MyAppMDKDataMetadataParser.options
        let metadata = parser.parseInProxy(MyAppMDKDataMetadataText.xml, url: "ESPM")
        metadata.proxyVersion = "26.3.0"
        return metadata
    }
}
