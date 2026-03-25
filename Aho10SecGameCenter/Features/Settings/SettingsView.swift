import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var settings: AppSettings = .init()
    @State private var restoreMessage = ""

    var body: some View {
        VStack(spacing: AppSpacing.md) {
            Text("設定")
                .font(AppTypography.title)

            Toggle("サウンド", isOn: $settings.soundEnabled)
            Toggle("バイブ", isOn: $settings.hapticsEnabled)

            Button("購入を復元") {
                Task {
                    let restored = await environment.monetization.restorePurchases()
                    restoreMessage = restored ? "復元を試しました" : "復元に失敗しました"
                }
            }

            if !restoreMessage.isEmpty {
                Text(restoreMessage)
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }

            Button("保存して戻る") {
                environment.updateSettings(settings)
                environment.router.showHome()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(AppColors.accent)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .padding(AppSpacing.lg)
        .onAppear { settings = environment.profile.settings }
    }
}
