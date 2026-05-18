//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SharedFmwk

open class ODataOnboardingStep: OnboardingStep {
    var controllers: [String: ODataControlling] = [:]
    private let logger = Logger.shared(named: "AppDelegateLogger")

    public func onboard(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        configureOData(using: context, completionHandler: completionHandler)
    }

    public func restore(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        configureOData(using: context, completionHandler: completionHandler)
    }

    public func reset(context: OnboardingContext, completionHandler: @escaping () -> Void) {
        defer { completionHandler() }
        do {
            try MyAppMDKDataOfflineODataController.removeStore(for: context.onboardingID)
        } catch {
            logger.error("Remove Offline Store failed", error: error)
        }
    }

    /// Read more about consumption of OData services in mobile applications: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/1c7d937d0c8a43f4aca7175e9051d108.html
    private func configureOData(using context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        let group = DispatchGroup()
        var odataControllers = [String: ODataControlling]()
        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary

        let myAppMDKDataOfflineODataDelegateSample = OfflineODataDelegateSample(for: "MyAppMDKData")
        odataControllers[ODataContainerType.myAppMDKData.description] = MyAppMDKDataOfflineODataController(delegate: myAppMDKDataOfflineODataDelegateSample)

        for (odataServiceName, odataController) in odataControllers {
            group.enter()
            let destinationId = destinations[odataServiceName] as! String
            // Adjust this path so it can be called after authentication and returns an HTTP 200 code. This is used to validate the authentication was successful.
            let configurationURL = URL(string: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters).backendURL.appendingPathComponent(destinationId).absoluteString)!

            do {
                try odataController.configureOData(sapURLSession: context.sapURLSession, serviceRoot: configurationURL, onboardingID: context.onboardingID)
                let connectivityStatus = ConnectivityUtils.isConnected()
                logger.info("Network connectivity status: \(connectivityStatus)")
                Task.detached {
                    do {
                        if connectivityStatus {
                            SAPFioriBannerHandler.shared.showTopBanner()
                        }
                        try await odataController.openOfflineStore(synchronize: connectivityStatus)
                    } catch {
                        SAPFioriBannerHandler.shared.hideTopBanner()
                        completionHandler(.failed(error))
                        return
                    }
                    self.controllers[odataServiceName] = odataController
                    group.leave()
                }
            } catch {
                completionHandler(.failed(error))
            }
        }
        group.notify(queue: .main) {
            completionHandler(.success(context))
        }
    }
}
