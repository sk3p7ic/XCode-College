//
//  ContentView.swift
//  TicTacToe
//
//  Created by Joshua Ibrom on 3/2/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var game: TTTGame = TTTGame()
    
    var body: some View {
        VStack {
            Text("TicTacToe")
                .font(.largeTitle)
            Spacer()
            HStack {
                Spacer()
                Text("X Score: \(game.scoreCross)")
                Spacer()
                Text("Y Score: \(game.scoreNought)")
                Spacer()
            }
            GameView(game: game)
            Text(game.getCurrentPlayer())
            Spacer()
        }
        .alert(isPresented: $game.doShowWinAlert) {
            Alert(title: Text(game.getWinnerText()), dismissButton: .default(Text("New Game")))
        }
        .alert(isPresented: $game.doShowDrawAlert) {
            Alert(title: Text("This game's a draw!"), dismissButton: .default(Text("New Game")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
