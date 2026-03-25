import SwiftUI
import SpriteKit

struct MiniGameContainerView: View {
    @EnvironmentObject private var environment: AppEnvironment
    let gameType: GameType
    @State private var result: GameResult?
    @State private var sceneID = UUID()

    var body: some View {
        VStack(spacing: AppSpacing.md) {
            HStack {
                Button("← 戻る") {
                    environment.router.showHome()
                }
                Spacer()
                Text(gameType.title)
                    .font(AppTypography.headline)
                    .multilineTextAlignment(.center)
                Spacer()
                Color.clear.frame(width: 56, height: 1)
            }
            .padding(.horizontal, AppSpacing.md)

            if let result {
                ResultView(result: result, onReplay: replay, onBackToHome: {
                    environment.router.showHome()
                })
                .padding(.horizontal, AppSpacing.md)
            } else {
                SpriteView(scene: makeScene(), options: [.allowsTransparency])
                    .id(sceneID)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                    .padding(AppSpacing.md)
            }
        }
        .padding(.vertical, AppSpacing.md)
        .toolbar(.hidden, for: .navigationBar)
    }

    private func replay() {
        result = nil
        sceneID = UUID()
    }

    private func makeScene() -> SKScene {
        let scene: BaseMiniGameScene
        switch gameType {
        case .wigDefense:
            scene = WigDefenseScene()
        case .stampMaster:
            scene = StampMasterScene()
        case .stayAwake:
            scene = StayAwakeScene()
        default:
            scene = StampMasterScene()
        }

        scene.size = CGSize(width: 390, height: 760)
        scene.onFinish = { rawResult in
            let currentBest = environment.records[rawResult.gameType]?.bestScore ?? 0
            let bestUpdated = rawResult.score > currentBest
            var projectedProfile = environment.profile
            projectedProfile.totalPlayCount += 1
            projectedProfile.totalCoins += rawResult.earnedCoins
            let missionCompleted = !environment.todayMission.completed && environment.missions.isMissionCompleted(
                profile: projectedProfile,
                mission: environment.todayMission
            )
            let finalResult = GameResult(
                gameType: rawResult.gameType,
                score: rawResult.score,
                bestScoreUpdated: bestUpdated,
                earnedCoins: rawResult.earnedCoins + (missionCompleted ? environment.todayMission.rewardCoins : 0),
                missionCompleted: missionCompleted,
                failReason: rawResult.failReason
            )
            environment.apply(result: finalResult)
            result = finalResult
        }
        return scene
    }
}
