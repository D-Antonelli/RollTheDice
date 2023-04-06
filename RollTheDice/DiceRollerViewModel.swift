//
//  ViewModel.swift
//  RollTheDice
//
//  Created by Derya Antonelli on 06/04/2023.
//

import Foundation

@MainActor class DiceRollerViewModel: ObservableObject {
    @Published private(set) var diceResult: [Int] = []
    @Published private(set) var previousRolls: [[Int]]
    @Published var numberOfDice = 1
    @Published var sidesOfDice = 6
    
    let diceOptions = [4, 6, 8, 10, 12, 20, 100]
    
    private let savePath = FileManager.documentsDirectory.appendingPathExtension("results.txt")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            previousRolls = try JSONDecoder().decode([[Int]].self, from: data)
        } catch {
            previousRolls = []
        }
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
        save()
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(previousRolls)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("\(error)")
        }
    }
    
    
}
