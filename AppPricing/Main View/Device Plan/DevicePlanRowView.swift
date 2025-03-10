import SwiftUI

struct DevicePlanRowView: View {
    private let devicePlan: DevicePlanUI
    
    init(devicePlan: DevicePlanUI) {
        self.devicePlan = devicePlan
    }
    
    var body: some View {
        bodyView
    }
}

private extension DevicePlanRowView {
    var bodyView: some View {
        VStack(alignment: .leading) {
            Text(devicePlan.name)
            Text(devicePlan.createdAt)
        }
    }
}
