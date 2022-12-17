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
    @State var turnCounter: Int  = 0
    @State var gameOver = false
    @State var winCounterForO: Int = 0
    @State var winCounterForX: Int  = 0
    
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
            // Displays tic tac toe gameboard if statement is true.
            if gameOver == false {
                
                // Scoreboard.
                HStack {
                    Text("O's score: \(winCounterForO)")
                        .font(.system(size: 18)).padding(.horizontal)
                    Text("X's score: \(winCounterForX)")
                        .font(.system(size: 18)).padding(.horizontal)
                }
                // Header displays current players turn.
                if turnCounter % 2 == 0 {
                    Text("O's turn")
                        .padding(40.0).font(.system(size: 32))
                        .foregroundColor(.orange)
                } else {
                    Text("X's turn")
                        .padding(40.0).font(.system(size: 32))
                        .foregroundColor(.purple)
                }
                
                Spacer()
                
                // VStack for grid of buttons.
                VStack {
                    // First row of buttons.
                    HStack {
                        ForEach(0..<3) { column in
                            Text("\(gameBoard[0][column])").onTapGesture {
                                if gameBoard[0][column] == "_" {
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
                    }
                    // Second row of buttons.
                    HStack {
                        ForEach(0..<3) { column in
                            Text("\(gameBoard[1][column])").onTapGesture {
                                if gameBoard[1][column] == "_" {
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
                    }
                    // Third row of buttons.
                    HStack {
                        ForEach(0..<3) { column in
                            Text("\(gameBoard[2][column])").onTapGesture {
                                if gameBoard[2][column] == "_" {
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
                
            // Displays winner screen.
            } else {

                // Displays text of winner.
                if turnCounter % 2 == 0 {
                    Text("Player X wins! 🎉").font(.system(size: 36))
                } else {
                    Text("Player O wins! 🎉").font(.system(size: 36))
                }
                
                // Resets board, adds point to winner.
                Button(action: {
                    if turnCounter % 2 == 0 {
                        winCounterForX += 1
                    } else {
                        winCounterForO += 1
                    }
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
