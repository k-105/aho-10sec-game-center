import SwiftUI

struct ShopView: View {
    @EnvironmentObject private var environment: AppEnvironment

    var body: some View {
        VStack(spacing: AppSpacing.md) {
            Text("ショップ")
                .font(AppTypography.title)
            Text("課金導線の雛形です。広告削除や応援チップをここに並べます。")
                .font(AppTypography.body)
                .multilineTextAlignment(.center)
            Button("広告削除を購入") {
                Task {
                    let purchased = await environment.monetization.purchaseAdRemoval()
                    if purchased {
                        environment.profile.adRemoved = true
                        environment.persistence.save(profile: environment.profile)
                    }
                }
            }
            .disabled(environment.profile.adRemoved)
            Button("戻る") { environment.router.showHome() }
        }
        .padding(AppSpacing.lg)
    }
}
