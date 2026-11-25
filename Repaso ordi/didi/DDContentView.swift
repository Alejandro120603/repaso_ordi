import SwiftUI

struct DDContentView: View {
    var body: some View {
        NavigationStack {
            DDInicioView()
        }
        .tint(.orange)
    }
}

#Preview {
    DDContentView()
}
