//
//  ContentView.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 03/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var diceResult = 0
    @State private var previousRolls = [Int]()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Dice Roller")
                .font(.largeTitle)
                .bold()
                .accessibilityLabel("Dice Roller")
            
            Text("Current Roll: \(diceResult)")
                .font(.title)
                .bold()
                .accessibilityLabel("Current Roll")
                .accessibilityValue("\(diceResult)")
            
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
        previousRolls.append(diceResult)
        diceResult = newRoll
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
