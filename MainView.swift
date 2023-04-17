import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = DiceRollerViewModel()

    var body: some View {
        TabView {
            RollTabView()
                .tabItem {
                    Image(systemName: "die.face.6.fill")
                    Text("Roll")
                }

            SettingsTabView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }

            HistoryTabView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
        }
        .environmentObject(viewModel)
        .accentColor(.blue)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
