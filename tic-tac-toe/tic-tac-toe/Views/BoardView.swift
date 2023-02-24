//
//  BoardView.swift
//  tic-tac-toe
//
//  Created by Joshua Ibrom on 2/23/23.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var game: TTTGame
    var resetHandler: () -> Void
    @State private var displayGameEndAlert: Bool = false
    @State private var resultText: String = ""
    @State private var resultDesc: String = ""
    @State private var scores: [UInt8] = [0, 0]
    @State private var currentPlayerText: String = "Current player: X"
    
    func handleGameEnd() {
        print("Handling the end")
        switch (game.gameState) {
        case GameResult.win:
            let winner = game.getWinner()
            if winner == -1 {
                resultText = "Error."
                break
            }
            scores[winner == 0 ? 0 : 1] += 1
            let winnerString = (winner == 0) ? "X" : "O"
            resultText = "\(winnerString) won!"
            break
        case GameResult.draw:
            resultText = "Must be high noon...It's a draw!"
            break
        default:
            resultText = "What happened?"
        }
        displayGameEndAlert = true
    }
    
    func gameUpdateHandler() {
        let playerText = (game.currentPlayer == 0) ? "X" : "O"
        currentPlayerText = "Current player: " + playerText
        if game.gameDidEnd {
            handleGameEnd()
        }
    }
    
    func gameEndAlertBtnClickHandler() {
        displayGameEndAlert = false
        resetHandler()
    }
    
    var body: some View {
        VStack {
            Grid {
                ForEach(0..<3) { r in
                    GridRow {
                        ForEach(0..<3) { c in
                            BoardButton(game: game, row: r, col: c, updateHandler: gameUpdateHandler)
                        }
                    }
                }
            }
            Text(currentPlayerText)
        }
        .alert(resultText, isPresented: $displayGameEndAlert) {
            Button("New Game?", action: gameEndAlertBtnClickHandler)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(game: TTTGame(), resetHandler: {})
    }
}
