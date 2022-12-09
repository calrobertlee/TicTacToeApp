//
//  ContentView.swift
//  Shared
//
//  Created by user on 12/8/22.
//

// Tried to use @Published with class
// Tried to use @Binding w/ @State (probably still the answer)
// Tried Array, not sure how to id each of the 9 cards, however.
// Real solution: requires MVVM perhaps?

import SwiftUI

struct ContentView: View {
    var cards: Array<String> = ["O","1","2","3","4","5","6","7","8",]
    var cardCount = 9
    
    var body: some View {
        VStack {
            Text("Player O's turn").font(.title)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) { // GridItem insead of numerical number because more control
                ForEach(cards[0..<cardCount], id: \.self) { cards in
                    SquareView(content: cards).aspectRatio(2/3, contentMode: .fill)
                }
            }
        }
    }
}

struct SquareView: View {
    @State var isOwned = true
    var content: String

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 8)
        
        ZStack {
            if isOwned {
                shape.fill(.white)
                shape.stroke(lineWidth: 4)
                Text(content).font(.title)
            } else {
                shape.fill(.white)
            }
        }.onTapGesture {
            isOwned = !isOwned
        }
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
