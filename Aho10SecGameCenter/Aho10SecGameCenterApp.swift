import SwiftUI

@main
struct Aho10SecGameCenterApp: App {
    @StateObject private var environment = AppEnvironment.bootstrap()

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(environment)
        }
    }
}
