import SwiftUI

@main
struct AppPricingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let contentViewInteractor = MainViewInteractor()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(contentViewInteractor)
        }
    }
}
