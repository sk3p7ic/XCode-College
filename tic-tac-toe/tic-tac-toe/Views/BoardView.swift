//
//  BoardView.swift
//  tic-tac-toe
//
//  Created by Joshua Ibrom on 2/23/23.
//

import SwiftUI

struct BoardView: View {
    var game: TTTGame
    
    var body: some View {
        Grid {
            ForEach(0..<3) { r in
                GridRow {
                    ForEach(0..<3) { c in
                        BoardButton(game: game, row: r, col: c)
                    }
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(game: TTTGame())
    }
}
