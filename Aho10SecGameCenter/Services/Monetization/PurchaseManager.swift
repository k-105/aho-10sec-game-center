import Foundation
import StoreKit

@MainActor
final class PurchaseManager: ObservableObject, MonetizationProviding {
    @Published private(set) var products: [Product] = []

    func loadProducts() async {
        do {
            products = try await Product.products(for: [ProductIDs.removeAds, ProductIDs.smallTip])
        } catch {
            products = []
        }
    }

    func purchaseAdRemoval() async -> Bool {
        guard let product = products.first(where: { $0.id == ProductIDs.removeAds }) else {
            return false
        }
        do {
            let result = try await product.purchase()
            if case .success = result {
                return true
            }
        } catch {
            return false
        }
        return false
    }

    func restorePurchases() async -> Bool {
        do {
            try await AppStore.sync()
            return true
        } catch {
            return false
        }
    }
}
