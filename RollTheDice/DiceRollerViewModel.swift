//
//  ViewModel.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 06/04/2023.
//

import Foundation

@MainActor class DiceRollerViewModel: ObservableObject {
    @Published private(set) var diceResult: [Int] = []
    @Published private(set) var previousRolls: [[Int]] = []
    @Published var numberOfDice = 1
    @Published var sidesOfDice = 6
    
    let diceOptions = [4, 6, 8, 10, 12, 20, 100]
    
    func save(diceResult: [Int]) {
        previousRolls.append(diceResult)
    }
    
    var diceTotal: Int {
        return diceResult.reduce(0, +)
    }
    
    func rollDice() {
        var newRoll: [Int] = []
        for _ in 0..<numberOfDice {
            newRoll.append(Int.random(in: 1...sidesOfDice))
        }
        if !diceResult.isEmpty {
            saveCurrentRoll()
        }
        diceResult = newRoll
    }
    
    private func saveCurrentRoll() {
        previousRolls.append(diceResult)
    }

    
//    func diceResultIsEmpty() -> Bool {
//        return diceResult.isEmpty
//    }
//    
//    func previousRollsIsEmpty() -> Bool {
//        return previousRolls.isEmpty
//    }
    
    
}
