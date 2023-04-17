import SwiftUI

struct RollTabView: View {
    @EnvironmentObject var viewModel: DiceRollerViewModel

    var body: some View {
        VStack {
            Spacer()
            
            if !viewModel.diceResult.isEmpty {
                HStack {
                    ForEach(viewModel.diceResult, id: \.self) { roll in
                        Image(systemName: "die.face.\(roll)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .accessibilityLabel("Die face \(roll)")
                    }
                }
            }


            if !viewModel.diceResult.isEmpty {
                Text("Total: \(viewModel.diceTotal)")
                    .font(.title)
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

