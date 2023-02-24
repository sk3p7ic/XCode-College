//
//  BoardButton.swift
//  tic-tac-toe
//
//  Created by Joshua Ibrom on 2/23/23.
//

import SwiftUI

struct BoardButton: View {
    @ObservedObject var game: TTTGame
    var row: Int
    var col: Int
    var updateHandler: () -> Void
    
    @State private var buttonText: String = "?"
    
    func idxToString() -> String {
        switch (game.board[row][col]) {
        case 0:
            return "X"
        case 1:
            return "O"
        default:
            return "?"
        }
    }
    
    func handleClick() {
        game.doUpdateTile(row, col)
        buttonText = idxToString()
        updateHandler()
    }
    
    var body: some View {
        Button {
            handleClick()
        } label: {
            Text("\(buttonText)")
                .font(.largeTitle)
        }
        .buttonStyle(.bordered)
    }
}

struct BoardButton_Previews: PreviewProvider {
    static var previews: some View {
        BoardButton(game: TTTGame(), row: 0, col: 0, updateHandler: {})
    }
}
