//
//  openStoreKitManageSubscriptionPreferences.swift
//  sub-manager
//
//  Created by Daniel Chudy on 4/29/24.
//

import Foundation
import UIKit
import StoreKit
import SwiftUI

extension View {
    func openStoreKitManageSubscriptionPreferences() {
        Task {
            do {
                if let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    try await StoreKit.AppStore.showManageSubscriptions(in: windowScene)
                    print("Opened StoreKit Manage Subscription Preferences.")
                }
            } catch {
                print("Failed to open StoreKit Manage Subscription Preferences with error \(error).")
            }
        }
    }
}
