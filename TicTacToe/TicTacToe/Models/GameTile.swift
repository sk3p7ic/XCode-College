//
//  GameTile.swift
//  TicTacToe
//
//  Created by Joshua Ibrom on 3/2/23.
//

import Foundation

enum Tile {
    case Empty
    case Nought
    case Cross
    
    func toString() -> String {
        switch (self) {
        case .Cross:
            return "X"
        case .Nought:
            return "O"
        case .Empty:
            return "?"
        }
    }
}
