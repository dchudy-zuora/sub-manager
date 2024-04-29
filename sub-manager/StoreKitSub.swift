////
////  StoreKitSub.swift
////  sub-manager
////
////  Created by Daniel Chudy on 4/19/24.
////
//
//import Foundation
//import UIKit
//import StoreKit
//
//extension UIView {
//    func openStoreKitManageSubscriptionPreferences() async {
//        guard let windowScene = self.window?.windowScene else {
//            debugPrint("openStoreKitManagePreferences - Failed to open StoreKit Manage Subscription Preferences as windowscene does not exist.")
//            return
//        }
//        do {
//            try await StoreKit.AppStore.showManageSubscriptions(in: windowScene)
//            debugPrint("openStoreKitManagePreferences - Opened StoreKit Manage Subscription Preferences.")
//        } catch {
//            debugPrint("openStoreKitManagePreferences - Failed to open StoreKit Manage Subscription Preferences with error \(error).")
//        }
//    }
//}
