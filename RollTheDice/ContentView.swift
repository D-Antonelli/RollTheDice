//
//  ContentView.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 03/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var diceResult: Int? = nil
    @State private var previousRolls = [Int]()
    @State private var numberOfDice = 1
    @State private var sidesOfDice = 6
    
    let diceOptions = [4, 6, 8, 10, 12, 20, 100]
    
    var body: some View {
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
            
            Text(diceResult != nil ? "Current Roll: \(diceResult!)" : "Roll the dice to start")
                .font(.title)
                .bold()
                .accessibilityLabel("Current Roll")
                .accessibilityValue(diceResult != nil ? "\(diceResult!)" : "No roll yet")
            
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
                
                ScrollView {
                    ForEach(previousRolls, id: \.self) { roll in
                        Text("Roll: \(roll)")
                            .font(.body)
                            .accessibilityLabel("Roll")
                            .accessibilityValue("\(roll)")
                    }
                }
            }
            .padding(.top)
            
            
        }
        .padding()
    }
    
    func rollDice() {
        let newRoll = Int.random(in: 1...6)
        if let previousResult = diceResult {
            previousRolls.append(previousResult)
        }
        diceResult = newRoll
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
