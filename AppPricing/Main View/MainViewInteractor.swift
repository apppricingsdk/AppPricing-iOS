import SwiftUI
import AppPricingSDK

@MainActor
class MainViewInteractor: ObservableObject {
    @Published var plans: [DevicePlanUI] = []
    
    private lazy var iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    private lazy var visualDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    func fetchPlans() {
        Task {
            do {
                let devicePlans = try await AppPricingInstance.getDevicePlans()
                self.plans = devicePlans.map(convertDevicePlanToUI(_:))
            } catch {
                print("Fetching device plans has failed.")
                print("Error: \(error.localizedDescription)")
                self.plans = []
            }
        }
    }
}

private extension MainViewInteractor {
    func convertDevicePlanToUI(_ devicePlan: DevicePlan) -> DevicePlanUI {
        let createdDate = iso8601DateFormatter.date(from: devicePlan.createdAt) ?? .now
        let formattedDate = visualDateFormatter.string(from: createdDate)
        return DevicePlanUI(id: devicePlan.id,
                            name: devicePlan.name,
                            createdAt: formattedDate)
    }
}
