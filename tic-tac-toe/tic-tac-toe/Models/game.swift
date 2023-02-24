//
//  game.swift
//  tic-tac-toe
//
//  Created by Joshua Ibrom on 2/23/23.
//

import Foundation

enum GameResult {
    case none, win, draw
}

class TTTGame: ObservableObject {
    @Published public var board: [[Int8]] = [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]]
    @Published public var currentPlayer: Int8 = 0
    @Published public var gameDidEnd: Bool = false
    @Published public var gameState: GameResult = GameResult.none
    
    func doUpdateTile(_ row: Int, _ col: Int) {
        if (board[row][col] != -1) {
            return
        }
        board[row][col] = currentPlayer
        currentPlayer = (currentPlayer == 0) ? 1 : 0
        let status = checkForWinner()
        gameDidEnd = status == GameResult.win || status == GameResult.draw
        print(gameDidEnd)
        gameState = status
    }
    
    func checkForWinner() -> GameResult {
        // Check rows
        for r in 0..<3 {
            let leftmostPlayer = board[r][0]
            if leftmostPlayer == -1 {
                continue
            }
            var didBreak = false
            for c in 0..<3 {
                if board[r][c] != leftmostPlayer {
                    didBreak = true
                    break
                }
            }
            if !didBreak {
                return GameResult.win
            }
        }
        // Check cols
        for c in 0..<3 {
            let topmostPlayer = board[0][c]
            if topmostPlayer == -1 {
                continue
            }
            var didBreak = false
            for r in 0..<3 {
                if board[r][c] != topmostPlayer {
                    didBreak = true
                    break
                }
            }
            if !didBreak {
                return GameResult.win
            }
        }
        // Check diagonals
        if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[1][1] != -1 {
            return GameResult.win
        }
        if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[1][1] != -1 {
            return GameResult.win
        }
        // Check for a draw by checking if any row contains -1 (unplayed tile)
        if board.map({$0.contains(-1)}) == [false, false, false] {
            return GameResult.draw
        }
        return GameResult.none
    }
    
    func getWinner() -> Int8 {
        if !gameDidEnd {
            return -1
        }
        // The winner will be the player that is not the current player
        return currentPlayer == 0 ? 1 : 0
    }
    
    func resetGame() {
        board = [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]]
        currentPlayer = 0
        gameDidEnd = false
    }
}
