import Foundation

@MainActor
final class AppEnvironment: ObservableObject {
    let persistence: PersistenceProviding
    let gameCenter: GameCenterProviding
    let monetization: MonetizationProviding
    let missions: DailyMissionService
    let audioManager: AudioManager
    let hapticsManager: HapticsManager

    @Published var router: AppRouter
    @Published var profile: PlayerProfile
    @Published var records: [GameType: GameRecord]
    @Published var achievements: [AchievementItem]
    @Published var todayMission: Mission
    @Published var latestResult: GameResult?

    init(
        router: AppRouter,
        persistence: PersistenceProviding,
        gameCenter: GameCenterProviding,
        monetization: MonetizationProviding,
        missions: DailyMissionService,
        audioManager: AudioManager,
        hapticsManager: HapticsManager,
        profile: PlayerProfile,
        records: [GameType: GameRecord],
        achievements: [AchievementItem],
        todayMission: Mission
    ) {
        self.router = router
        self.persistence = persistence
        self.gameCenter = gameCenter
        self.monetization = monetization
        self.missions = missions
        self.audioManager = audioManager
        self.hapticsManager = hapticsManager
        self.profile = profile
        self.records = records
        self.achievements = achievements
        self.todayMission = todayMission
    }

    static func bootstrap() -> AppEnvironment {
        let persistence = LocalPersistenceService()
        let router = AppRouter()
        let monetization = PurchaseManager()
        let missions = DailyMissionService()
        let environment = AppEnvironment(
            router: router,
            persistence: persistence,
            gameCenter: GameCenterService(),
            monetization: monetization,
            missions: missions,
            audioManager: AudioManager(),
            hapticsManager: HapticsManager(),
            profile: persistence.loadProfile(),
            records: persistence.loadRecords(),
            achievements: persistence.loadAchievements(),
            todayMission: missions.makeTodayMission()
        )
        Task {
            await environment.initializeServices()
        }
        return environment
    }

    func initializeServices() async {
        await gameCenter.authenticate()
        await monetization.loadProducts()
    }

    func apply(result: GameResult) {
        latestResult = result

        profile.totalPlayCount += 1
        if result.failReason != nil {
            profile.totalFailCount += 1
        }
        profile.totalCoins += result.earnedCoins

        var record = records[result.gameType] ?? GameRecord(gameType: result.gameType)
        record.playCount += 1
        record.totalScore += result.score
        if result.failReason != nil {
            record.failCount += 1
        }
        if result.score > record.bestScore {
            record.bestScore = result.score
        }
        records[result.gameType] = record

        if result.missionCompleted {
            todayMission.completed = true
        }

        persistence.save(profile: profile)
        persistence.save(records: records)
        persistence.save(achievements: achievements)

        Task {
            await gameCenter.submit(score: result.score, for: result.gameType)
        }
    }

    func updateSettings(_ settings: AppSettings) {
        profile.settings = settings
        persistence.save(profile: profile)
    }

    func completeTitleFlow() {
        if !profile.settings.tutorialShown {
            profile.settings.tutorialShown = true
            persistence.save(profile: profile)
        }
        router.showHome()
    }

    func resetLatestResult() {
        latestResult = nil
    }
}
