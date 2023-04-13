//
//  SettingsTabView.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 13/04/2023.
//

import SwiftUI

struct SettingsTabView: View {
    @EnvironmentObject var viewModel: DiceRollerViewModel

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack {
                    Text("Number of Dice: ")
                    Picker("Number of Dice", selection: $viewModel.numberOfDice) {
                        ForEach(1...10, id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 120, height: 100)
                    .clipped()
                }
                .accessibilityLabel("Number of dice picker")

                VStack {
                    Text("Sides of Dice:")
                    Picker("Sides of Dice", selection: $viewModel.sidesOfDice) {
                        ForEach(viewModel.diceOptions, id: \.self) { sides in
                            Text("\(sides)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 120, height: 100)
                    .clipped()
                }
                .accessibilityLabel("Sides of dice picker")
            }

            Spacer()
        }
        .padding()
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView().environmentObject(DiceRollerViewModel())
    }
}

