import SwiftUI
import StoreKit
import UIKit

struct ContentView: View {
    @StateObject var storeKit = StoreKitManager()
    
    var body: some View {
        VStack {
            Text("Offerings")
            Divider()
            ForEach(storeKit.storeProducts) {
                product in
                HStack {
                    Text(product.displayName)
                    Spacer()
                    Button(action: {
                        Task {
                            try await storeKit.purchase(product)
                        }
                    }) {
                        CourseItem(storeKit: storeKit, product: product)
                    }
                }
            }
            Divider()
            Button(action: {
                Task {
                    self.openStoreKitManageSubscriptionPreferences()
                }
            }) {
                Text("Manage Subscriptions")
            }
            Divider()
            Button("Restore Purchases", action: {
                Task {
                    //This call displays a system prompt that asks users to authenticate with their App Store credentials.
                    //Call this function only in response to an explicit user action, such as tapping a button.
                    try? await AppStore.sync()
                }
            })
            
//            Button("Manage Subscriptions") {
//                // Present subscription management view
//                showSubscriptionManagement()
//            }
            
        }
        .padding()
        
    
    }
}

struct CourseItem: View {
    @ObservedObject var storeKit : StoreKitManager
    @State var isPurchased: Bool = false
    var product: Product
    
    var body: some View {
        VStack {
            if isPurchased {
                Text(Image(systemName: "checkmark"))
                    .bold()
                    .padding(10)
            } else {
                Text(product.displayPrice)
                    .padding(10)
            }
        }
        .onChange(of: storeKit.purchasedCourses) { val, course in
            Task {
                isPurchased = (try? await storeKit.isPurchased(product)) ?? false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
