import SwiftUI
import AppPricingSDK

struct MainView: View {
    @EnvironmentObject private var interactor: MainViewInteractor
    
    var body: some View {
        bodyView
            .track(pageName: "ContentView")
    }
}

private extension MainView {
    var bodyView: some View {
        VStack {
            if !interactor.plans.isEmpty {
                devicePlanListView
            }
            Button {
                interactor.fetchPlans()
            } label: {
                Text("Get Plans")
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
        }
    }
    
    var devicePlanListView: some View {
        List(interactor.plans) { plan in
            DevicePlanRowView(devicePlan: plan)
        }
    }
}
