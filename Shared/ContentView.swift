//
//  ContentView.swift
//  Shared
//
//  Created by C.R. Lee on 12/8/22.
//

import SwiftUI

struct ContentView: View {
    
    // Declare the game board and empty array.
    @State var gameBoard:[[String]] = [["_","_","_"],["_","_","_"],["_","_","_"]]

    @State var turnCounter = 0

    let markerX = "X"
    let markerO = "O"
    var gameOver = false
    
    var body: some View {
        VStack {
            Text("Turn: \(turnCounter)")
            
            VStack {
                if turnCounter % 2 == 0 {
                    HStack {
                        Text("\(gameBoard[0][0])").onTapGesture {
                            gameBoard[0][0] = markerO
                            turnCounter += 1
                        }
                        Text("\(gameBoard[0][1])").onTapGesture {
                            gameBoard[0][1] = markerO
                            turnCounter += 1
                        }
                        Text("\(gameBoard[0][2])").onTapGesture {
                            gameBoard[0][2] = markerO
                            turnCounter += 1
                        }
                    }
                    HStack {
                        Text("\(gameBoard[1][0])").onTapGesture {
                            gameBoard[1][0] = markerO
                            turnCounter += 1
                        }
                        Text("\(gameBoard[1][1])").onTapGesture {
                            gameBoard[1][1] = markerO
                            turnCounter += 1
                        }
                        Text("\(gameBoard[1][2])").onTapGesture {
                            gameBoard[1][2] = markerO
                            turnCounter += 1
                        }
                    }
                    HStack {
                        Text("\(gameBoard[2][0])").onTapGesture {
                            gameBoard[2][0] = markerO
                            turnCounter += 1
                        }
                        Text("\(gameBoard[2][1])").onTapGesture {
                            gameBoard[2][1] = markerO
                            turnCounter += 1
                        }
                        Text("\(gameBoard[2][2])").onTapGesture {
                            gameBoard[2][2] = markerO
                            turnCounter += 1
                        }
                    }
                } else {
                    HStack {
                        Text("\(gameBoard[0][0])").onTapGesture {
                            gameBoard[0][0] = markerX
                            turnCounter += 1
                        }
                        Text("\(gameBoard[0][1])").onTapGesture {
                            gameBoard[0][1] = markerX
                            turnCounter += 1
                        }
                        Text("\(gameBoard[0][2])").onTapGesture {
                            gameBoard[0][2] = markerX
                            turnCounter += 1
                        }
                    }
                    HStack {
                        Text("\(gameBoard[1][0])").onTapGesture {
                            gameBoard[1][0] = markerX
                            turnCounter += 1
                        }
                        Text("\(gameBoard[1][1])").onTapGesture {
                            gameBoard[1][1] = markerX
                            turnCounter += 1
                        }
                        Text("\(gameBoard[1][2])").onTapGesture {
                            gameBoard[1][2] = markerX
                            turnCounter += 1
                        }
                    }
                    HStack {
                        Text("\(gameBoard[2][0])").onTapGesture {
                            gameBoard[2][0] = markerX
                            turnCounter += 1
                        }
                        Text("\(gameBoard[2][1])").onTapGesture {
                            gameBoard[2][1] = markerX
                            turnCounter += 1
                        }
                        Text("\(gameBoard[2][2])").onTapGesture {
                            gameBoard[2][2] = markerX
                            turnCounter += 1
                        }
                    }
                }
                
            }.font(.system(size: 50))
        }
    }
}
   
















/*
 We need:
 1. Squares in a grid
 2. Squares need to keep track of:
    - If they are owned by a player.
    - Which player owns them.
    - If they've been clicked on.
 3. A grid which understands the current layout of owned squares.
 4. A method for which to switch between Player 1 and Player 2.
    - This method also needs to alter which squares are handed out based on the current player.
 
 Systems include:
 - Squares
 - Grid
 - Memory
 */













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
