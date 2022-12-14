//
//  ContentView.swift
//  Shared
//
//  Created by C.R. Lee on 12/8/22.
//

/// To Do:
/// -[ ] Change Player count to show only either Player's O or X (instead of number count).
/// -[ ] Update win screen to change copy based on which player is the winner.
/// -[ ] Fix so grids can only be marked once per round.
/// -[ ] Figure out how to add win condition for columns and diagonals.
/// -[ ] Nice to have: Add win counter.

import SwiftUI

struct ContentView: View {
    
    // Declare the game board and empty array.
    @State var gameBoard:[[String]] = [["_","_","_"],["_","_","_"],["_","_","_"]]
    @State var turnCounter = 0
    @State var gameOver = false
    
    // Mark X or O.
    let markerX = "X"
    let markerO = "O"
 
    // Function to check for win condition.
    func checkWinCondition() {
        for i in 0...2 {
            if gameBoard[i].allSatisfy({ $0 == "O" }){
                gameOver = true
            }
        }
        for i in 0...2 {
            if gameBoard[i].allSatisfy({ $0 == "X" }){
                gameOver = true
            }
        }
   }
    
    var body: some View {
        VStack {
            if gameOver == false {
                
                Text("Turn: \(turnCounter)").padding(50.0)
                
                Spacer()
                
                VStack {
                    HStack {
                        ForEach(0..<3) { column in
                            Text("\(gameBoard[0][column])").onTapGesture {
                                if turnCounter % 2 == 0 {
                                    gameBoard[0][column] = markerO
                                } else {
                                    gameBoard[0][column] = markerX
                                }
                                turnCounter += 1
                                checkWinCondition()
                            }
                        }
                    }
                    HStack {
                        ForEach(0..<3) { column in
                            Text("\(gameBoard[1][column])").onTapGesture {
                                if turnCounter % 2 == 0 {
                                    gameBoard[1][column] = markerO
                                } else {
                                    gameBoard[1][column] = markerX
                                }
                                turnCounter += 1
                                checkWinCondition()
                            }
                        }
                    }
                    HStack {
                        ForEach(0..<3) { column in
                            Text("\(gameBoard[2][column])").onTapGesture {
                                if turnCounter % 2 == 0 {
                                    gameBoard[2][column] = markerO
                                } else {
                                    gameBoard[2][column] = markerX
                                }
                                turnCounter += 1
                                checkWinCondition()
                            }
                        }
                    }
                }.font(.system(size: 50))

                Spacer()
                
                Button(action: {
                    turnCounter = 0
                    gameBoard = [["_","_","_"],["_","_","_"],["_","_","_"]]
                }, label: {
                    Text("Reset Board")
                }).padding(50.0)
                
            } else {

                Text("Player X wins! 🎉").font(.system(size: 36))
                
                Button(action: {
                    gameOver = false
                    turnCounter = 0
                    gameBoard = [["_","_","_"],["_","_","_"],["_","_","_"]]
                }, label: {
                    Text("Reset Board")
                }).padding(50.0)
                
            }
        }
    }
}
   




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
