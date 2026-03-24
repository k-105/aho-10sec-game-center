import StoreKit

@MainActor
protocol MonetizationProviding {
    var products: [Product] { get }
    func loadProducts() async
    func purchaseAdRemoval() async -> Bool
    func restorePurchases() async -> Bool
}
