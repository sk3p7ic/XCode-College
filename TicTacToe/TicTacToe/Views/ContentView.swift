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
            GameView(game: game)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
