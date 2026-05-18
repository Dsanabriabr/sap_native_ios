//
// MyAppNativeiOS
//
// Created by SAP BTP SDK Assistant for iOS v26.4.0 application on 14/05/26
//

import Foundation

/// Localized strings used by Onboarding
class LocalizedStrings {
    enum AppDelegate {
        static let startDemoModeTitle = NSLocalizedString("keyDemoModeSelectedTitle", value: "Demo Mode", comment: "XTIT: Title of alert action that the demo mode is selected.")
        static let startDemoModeMessage = NSLocalizedString("keyDemoModeSelectedMessage", value: "The Demo mode with Offline OData is not implemented in the generated application.", comment: "XMSG: Message that the user selected the demo mode.")
        static let startDemoModeRestartTitle = NSLocalizedString("keyGoBackButtonTitle", value: "Go back", comment: "XBUT: Title of go back button.")
        static let urlNotSupportedTitle = NSLocalizedString("keyUrlNotSupportedAlertTitle", value: "Alert!", comment: "XTIT: Title of alert action that the url is not supported.")
        static let urlNotSupportedMessage = NSLocalizedString("keyUrlNotSupportedMessage", value: "This url is currently not supported.", comment: "XMSG: Message that the url is not supported.")
        static let verificationFailedTitle = NSLocalizedString("keyVerificationFailedAlertTitle", value: "Failed!", comment: "XTIT: Title of alert that the signature verification failed.")
        static let verificationFailedMessage = NSLocalizedString("keyVerificationFailedMessage", value: "The digital signature could'nt be verified.", comment: "XTIT: Message that the signature verification failed.")
        static let urlNotSupportedOKButtonTitle = NSLocalizedString("keyUrlNotSupportedOKButtonTitle", value: "Okay", comment: "XBUT: Title of ok button.")
    }

    enum Onboarding {
        static let failedToLogonTitle = NSLocalizedString("keyErrorLogonProcessFailedTitle", value: "Failed to logon!", comment: "XTIT: Title of alert message about logon process failure.")
        static let retryTitle = NSLocalizedString("keyRetryButtonTitle", value: "Retry", comment: "XBUT: Title of Retry button.")
        static let resetPasscodeTitle = NSLocalizedString("keyResetPasscodeButtonTitle", value: "Reset Passcode", comment: "XBUT: Title of Reset Passcode button.")
        static let resetTitle = NSLocalizedString("keyResetButtonTitle", value: "Reset", comment: "XBUT: Title of Reset button.")
        static let passcodeRetryLimitReachedTitle = NSLocalizedString("keyErrorPasscodeRetryLimitReachedTitle", value: "Passcode Retry Limit Reached!", comment: "XTIT: Title of alert action that the passcode retry limit has been reached.")
        static let passcodeRetryLimitReachedMessage = NSLocalizedString("keyErrorPasscodeRetryLimitReachedMessage", value: "Reached the maximum number of retries. Application should be reset.", comment: "XMSG: Message that the application shall be reseted because the passcode retry limit has been reached.")
        static let switchWindowWhileOnboardingMessage = NSLocalizedString("keySwitchWindowWhileOnboardingMessage", value: "Switch the window for onboarding.", comment: "XMSG: Switch the window for onboarding.")
        static let switchWindowToUnlockMessage = NSLocalizedString("keySwitchWindowToUnlockMessage", value: "App is Locked. Switch the Window to Unlock.", comment: "XMSG: App is Locked. Switch the Window to Unlock.")
        static let lockTitle = NSLocalizedString("keyLockConditionTitle", value: "Locking app..", comment: "XTIT: Title for lock condition alert.")
        static let lockMessage = NSLocalizedString("keyLockConditionMessage", value: "Lock Condition Met. To use Application, please Connect to Network and Retry.", comment: "XMSG: Message explaining lock condition.")
        static let wipeTitle = NSLocalizedString("keyWipeConditionTitle", value: "Resetting app..", comment: "XTIT: Title for wipe condition alert.")
        static let wipeMessage = NSLocalizedString("keyWipeConditionMessage", value: "Wipe Condition Met. To use Application, please Connect to Network and Retry.", comment: "XMSG: Message explaining wipe condition.")
        static let trafficLockedMessage = NSLocalizedString("keyTrafficLockedMessage", value: "You will be logged out as Lock Condition is met. Please Relogin to continue to Application.", comment: "XMSG: Message explaining traffic locked condition.")
        static let trafficWipedMessage = NSLocalizedString("keyTrafficWipedMessage", value: "The app will reset as Wipe Condition is met.", comment: "XMSG: Message explaining traffic wiped condition.")
        static let syncFailedTitle = NSLocalizedString("keySyncFailedTitle", value: "Sync Failed", comment: "XTIT: Title for sync failed error banner.")
        static let transactionIssueTitle = NSLocalizedString("keyTransactionIssueTitle", value: "Transaction Issue", comment: "XTIT: Title for transaction issue screen.")
        static let transactionIssueMessage = NSLocalizedString("keyTransactionIssueMessage", value: "Before you can access your account on this device, hand over the device to:", comment: "XMSG: Message explaining transaction issue.")
        static let transactionIssueDetailMessage = NSLocalizedString("keyTransactionIssueDetailMessage", value: "They will need to sign in with their account and resolve their transaction issue.", comment: "XMSG: Detail message explaining how to resolve transaction issue.")
    }

    enum OfflineOData {
        static let openingOfflineStoreMessage = NSLocalizedString("keyOpeningOfflineStoreMessage", value: "Opening offline store", comment: "XMSG: Message that the application is opening the offline store.")
        static let updatingLocalDataMessage = NSLocalizedString("keyUpdatingLocalDataMessage", value: "Updating local data", comment: "XMSG: Message that the application is updating the local data from the offline store.")
        static let uploadingLocalDataMessage = NSLocalizedString("keyUploadingLocalDataMessage", value: "Uploading local data", comment: "XMSG: Message that the application is uploading the local data to the offline store.")
        static let sendingOfflineStoreMessage = NSLocalizedString("keySendingOfflineStoreMessage", value: "Sending offline store", comment: "XMSG: Message that the application is sending the offline store.")
        static let synchronizingDataMessage = NSLocalizedString("keySynchronizingDataMessage", value: "Synchronizing Data", comment: "XMSG: Message that the application is Synchronizing Data.")
        static let networkUnavailableMessage = NSLocalizedString("keyNetworkUnavailableMessage", value: "No Internet Connection", comment: "XMSG: Message that the synchronize failed due to internet connectivity issue.")
    }
}
