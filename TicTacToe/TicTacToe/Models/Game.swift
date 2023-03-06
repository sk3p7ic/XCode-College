//
//  Game.swift
//  TicTacToe
//
//  Created by Joshua Ibrom on 3/2/23.
//

import Foundation

enum GameCheckState {
    case Win, Draw, None
}

class TTTGame: ObservableObject {
    @Published var board: [[Tile]] = []
    @Published var currentPlayer: Tile = Tile.Cross
    @Published var scoreCross: Int8 = 0
    @Published var scoreNought: Int8 = 0
    @Published var doShowWinAlert: Bool = false
    @Published var doShowDrawAlert: Bool = false
    
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
        let state = checkForWinnerOrDraw(row, col)
        if state == GameCheckState.Win {
            if currentPlayer == Tile.Cross {
                scoreCross += 1
            }
            else {
                scoreNought += 1
            }
            resetGame()
            doShowWinAlert = true
        }
        else if state == GameCheckState.Draw {
            resetGame()
            doShowDrawAlert = true
        }
        else {
            currentPlayer = (currentPlayer == Tile.Cross) ? Tile.Nought : Tile.Cross
        }
    }
    
    func getCurrentPlayer() -> String {
        return "Current Player: " + ((currentPlayer == Tile.Cross) ? "X" : "O")
    }
    
    func getWinnerText() -> String {
        return currentPlayer == Tile.Cross ? "X Wins!" : "O Wins!"
    }
    
    private func checkForWinnerOrDraw(_ row: Int,_ col: Int) -> GameCheckState {
        // Check row and column for winner
        if board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][2] == currentPlayer {
            // This player has won
            return GameCheckState.Win
        }
        
        if board[0][col] == board[1][col] && board[1][col] == board[2][col] && board[2][col] == currentPlayer {
            // This player has won
            return GameCheckState.Win
        }
        
        // Check diagonals for winner
        if board[1][1] == currentPlayer {
            if board[0][0] == board[1][1] && board[1][1] == board[2][2] ||
                board[0][2] == board[1][1] && board[1][1] == board[2][0] {
                // This player has won
                return GameCheckState.Win
            }
        }
        
        // Check for draw
        if board.map({r in r.contains(Tile.Empty)}) == [false, false, false] {
            return GameCheckState.Draw
        }
        
        // There is no win or draw
        return GameCheckState.None
    }
}
