//
//  Game.swift
//  TicTacToe
//
//  Created by Joshua Ibrom on 3/2/23.
//

import Foundation

class TTTGame: ObservableObject {
    @Published var board: [[Tile]] = []
    @Published var currentPlayer: Tile = Tile.Cross
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        // Build a new board
        board = [[Tile]]()
        for _ in 0...2 {
            var row = [Tile]()
            for _ in 0...2 {
                row.append(Tile.Empty)
            }
            board.append(row)
        }
        
        // Reset who the first player is
        currentPlayer = Tile.Cross
    }
    
    func doMove(_ row: Int, _ col: Int) {
        // Make sure the space is not occupied
        if board[row][col] != Tile.Empty {
            return
        }
        
        board[row][col] = currentPlayer
        checkForWinnerOrDraw(row, col)
        currentPlayer = (currentPlayer == Tile.Cross) ? Tile.Nought : Tile.Cross
    }
    
    func checkForWinnerOrDraw(_ row: Int,_ col: Int) {
        // Check row and column for winner
        if board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][2] == currentPlayer {
            // This player has won
            return
        }
        
        if board[0][col] == board[1][col] && board[1][col] == board[2][col] && board[2][col] == currentPlayer {
            // This player has won
            return
        }
        
        // Check diagonals for winner
        if board[1][1] == currentPlayer {
            if board[0][0] == board[1][1] && board[1][1] == board[2][2] {
                // This player has won
                return
            }
            
            if board[0][2] == board[1][1] && board[1][1] == board[2][0] {
                // This player has won
                return
            }
        }
    }
}
