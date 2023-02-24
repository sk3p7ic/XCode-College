//
//  ContentView.swift
//  tic-tac-toe
//
//  Created by Joshua Ibrom on 2/23/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: TTTGame = TTTGame()
    @State private var scores: [UInt8] = [0, 0]
    
    func handleGameReset() {
        game.resetGame()
    }
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.title)
            BoardView(game: game, resetHandler: handleGameReset)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
