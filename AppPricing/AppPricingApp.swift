import SwiftUI

@main
struct AppPricingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let mainViewInteractor = MainViewInteractor()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainViewInteractor)
        }
    }
}
