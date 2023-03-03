//
//  GameView.swift
//  TicTacToe
//
//  Created by Joshua Ibrom on 3/2/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game: TTTGame
    
    var body: some View {
        VStack {
            Grid (horizontalSpacing: 4, verticalSpacing: 4){
                ForEach(0..<3) { row in
                    GridRow {
                        ForEach(0..<3) { col in
                            Text(game.board[row][col].toString())
                                .font(.largeTitle)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .background(.white)
                                .onTapGesture {
                                    game.doMove(row, col)
                                }
                        }
                    }
                }
            }
        }
        .background(.black)
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: TTTGame())
    }
}
