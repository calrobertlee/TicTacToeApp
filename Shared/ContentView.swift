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
/// -[X] Figure out how to add win condition for columns and diagonals.
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
        // for-in loop to check if rows are identical.
        for i in 0...2 {
            if gameBoard[i].allSatisfy({ $0 == "O" }){
                gameOver = true
            }
            if gameBoard[i].allSatisfy({ $0 == "X" }){
                gameOver = true
            }
        }
        // for-in loop to check if columns are identical.
        for i in 0...2 {
            // Use .map and .filter methods to filter the first element of each of the arrays and return a Bool statement to check if equals to "O" or "X".
            if gameBoard.map({ $0[i] }).filter({ $0 == "O" }).count == 3 {
               gameOver = true
            }
            if gameBoard.map({ $0[i] }).filter({ $0 == "X" }).count == 3 {
               gameOver = true
            }
        }
        // if to check if diagonals are identical.
        if [gameBoard[0][0], gameBoard[1][1],gameBoard[2][2]] == ["O","O","O"] ||
            [gameBoard[0][2], gameBoard[1][1],gameBoard[2][0]] == ["O","O","O"]
        {
            gameOver = true
        }
        if [gameBoard[0][0], gameBoard[1][1],gameBoard[2][2]] == ["X","X","X"] ||
            [gameBoard[0][2], gameBoard[1][1],gameBoard[2][0]] == ["X","X","X"]
        {
            gameOver = true
        }

   }
    
    var body: some View {
        VStack {
            if gameOver == false {
                
                Text("Turn: \(turnCounter)").padding(50.0)
                
                Spacer()
                
                VStack {
                    // First row of buttons.
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
                    // Second row of buttons.
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
                    // Third row of buttons.
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
                
                // Resets board.
                Button(action: {
                    turnCounter = 0
                    gameBoard = [["_","_","_"],["_","_","_"],["_","_","_"]]
                }, label: {
                    Text("Reset Board")
                }).padding(50.0)
                
            } else {

                // Win state screen.
                Text("Player X wins! 🎉").font(.system(size: 36))
                
                // Resets board.
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
