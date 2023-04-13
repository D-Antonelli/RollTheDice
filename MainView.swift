//
//  MainView.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 13/04/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = DiceRollerViewModel()

    var body: some View {
        TabView {
            RollTabView()
                .tabItem {
                    Image(systemName: "die.face.6")
                    Text("Roll")
                }

            SettingsTabView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }

            HistoryTabView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
        }
        .environmentObject(viewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

