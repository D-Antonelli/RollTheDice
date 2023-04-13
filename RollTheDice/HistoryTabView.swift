//
//  HistoryTabView.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 13/04/2023.
//

import SwiftUI

struct HistoryTabView: View {
    @EnvironmentObject var viewModel: DiceRollerViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Previous Rolls:")
                .font(.title2)
                .bold()
                .accessibilityLabel("Previous Rolls")

            if viewModel.previousRolls.isEmpty {
                Text("No previous rolls")
                    .font(.body)
                    .italic()
            } else {
                ScrollView {
                    ForEach(viewModel.previousRolls, id: \.self) { roll in
                        Text("Roll: \(formatDiceResults(roll))")
                            .font(.body)
                            .accessibilityLabel("Roll")
                            .accessibilityValue(formatDiceResults(roll))
                    }
                }
            }

            Spacer()
        }
        .padding()
    }

    func formatDiceResults(_ results: [Int]) -> String {
        results.map { String($0) }.joined(separator: ", ")
    }
}

struct HistoryTabView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTabView().environmentObject(DiceRollerViewModel())
    }
}

