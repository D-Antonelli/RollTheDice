//
//  ContentView.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 03/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var diceResult: [Int] = []
    @State private var previousRolls: [[Int]] = []
    @State private var numberOfDice = 1
    @State private var sidesOfDice = 6
    
    let diceOptions = [4, 6, 8, 10, 12, 20, 100]
    
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
                        Picker("Number of Dice", selection: $numberOfDice) {
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
                        Picker("Sides of Dice", selection: $sidesOfDice) {
                            ForEach(diceOptions, id: \.self){ sides in
                                Text("\(sides)")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 120, height: 100)
                        .clipped()
                    }
                    .accessibilityLabel("Sides of dice picker")
                }
                
                Text(diceResult.isEmpty ? "No rolls yet" : "Current Roll: \(formatDiceResults(diceResult))")
                    .font(.title)
                    .bold()
                    .accessibilityLabel("Current Roll")
                    .accessibilityValue(diceResult.isEmpty ? "No roll yet" : formatDiceResults(diceResult))
                
                Button(action: rollDice) {
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
                    
                    if previousRolls.isEmpty {
                        Text("No previous rolls")
                            .font(.body)
                            .italic()
                    } else {
                        ScrollView {
                            ForEach(previousRolls, id: \.self) { roll in
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
    
    func rollDice() {
        var newRoll: [Int] = []
        
        for _ in 0..<numberOfDice {
            newRoll.append(Int.random(in: 1...sidesOfDice))
        }
        
        if !diceResult.isEmpty {
            previousRolls.append(diceResult)
        }
        
        diceResult = newRoll
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
