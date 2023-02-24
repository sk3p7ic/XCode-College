//
//  ContentView.swift
//  tic-tac-toe
//
//  Created by Joshua Ibrom on 2/23/23.
//

import SwiftUI

struct ContentView: View {
    @State var game: TTTGame = TTTGame()
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.title)
            BoardView(game: game)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
