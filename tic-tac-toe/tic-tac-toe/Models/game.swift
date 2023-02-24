//
//  game.swift
//  tic-tac-toe
//
//  Created by Joshua Ibrom on 2/23/23.
//

import Foundation

class TTTGame {
    public var board: [[Int8]] = [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]]
    public var currentPlayer: Int8 = 0
    
    func doUpdateTile(_ row: Int, _ col: Int) {
        if (board[row][col] != -1) {
            return
        }
        print("Updating")
        board[row][col] = currentPlayer
        currentPlayer = (currentPlayer == 0) ? 1 : 0
    }
}
