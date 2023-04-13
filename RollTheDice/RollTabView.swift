//
//  RollTabView.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 13/04/2023.
//

import SwiftUI

struct RollTabView: View {
    @EnvironmentObject var viewModel: DiceRollerViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.diceResult.isEmpty ? "No rolls yet" : "Current Roll: \(formatDiceResults(viewModel.diceResult))")
                .font(.title)
                .bold()
                .accessibilityLabel("Current Roll")
                .accessibilityValue(viewModel.diceResult.isEmpty ? "No roll yet" : formatDiceResults(viewModel.diceResult))

            if !viewModel.diceResult.isEmpty {
                Text("Total: \(viewModel.diceTotal)")
                    .font(.title2)
                    .bold()
                    .accessibilityLabel("Total")
                    .accessibilityValue("\(viewModel.diceTotal)")
            }

            Button {
                Task.init {
                    await viewModel.rollDice()
                }

            } label: {
                Text("Roll Dice")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .accessibilityLabel("Roll dice")

            Spacer()
        }
        .padding()
    }

    func formatDiceResults(_ results: [Int]) -> String {
        results.map { String($0) }.joined(separator: ", ")
    }
}

struct RollTabView_Previews: PreviewProvider {
    static var previews: some View {
        RollTabView().environmentObject(DiceRollerViewModel())
    }
}
