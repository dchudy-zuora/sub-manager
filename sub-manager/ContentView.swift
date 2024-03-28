import SwiftUI
import StoreKit

struct ContentView: View {
    @StateObject var storeKit = StoreKitManager()
    var body: some View {
        VStack {
            Text("Offerings")
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
                        Text("Buy")
                    }
                }
            }
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
