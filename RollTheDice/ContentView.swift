//
//  ContentView.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 03/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DiceRollerViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Dice Roller")
                    .font(.largeTitle)
                    .bold()
                    .accessibilityLabel("Dice Roller")
                
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
                            ForEach(viewModel.diceOptions, id: \.self){ sides in
                                Text("\(sides)")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 120, height: 100)
                        .clipped()
                    }
                    .accessibilityLabel("Sides of dice picker")
                }
                
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
                    viewModel.rollDice()
                } label: {
                    Text("Roll Dice")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                .accessibilityLabel("Roll dice")
                
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
                }
                .padding(.top)
                
                
            }
            .padding()
        }
    }
    
    func formatDiceResults(_ results: [Int]) -> String {
        results.map { String($0) }.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
