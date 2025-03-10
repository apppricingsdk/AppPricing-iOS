import UIKit
import AppPricingSDK

class AppDelegate: NSObject, UIApplicationDelegate {
    private let apiKey = "53df5fd0011b54d1242659e03b10e4f1cc3d20ba6182a2fcb73b503ea500e155"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AppPricingInstance.initialize(apiKey: apiKey)

        return true
    }
}
