/**
 This class is responsible to encapsulate the game logic and
 rules for a tictactoe app
 **/

import Foundation

class LogicAndRules {
    //most of my variables are globally declared here
    var currentPlayer = 1
    var playerOneName: String?
    var playerTwoName: String?
    var boardArray = ["", "", "", "", "", "", "", "", ""]
    var countPLayer1 = 0
    var countPlayer2 = 0
    var winner: String?
    
    func switchPlayers(){ //function to switch players
        if currentPlayer == 1{
            currentPlayer = 2
        } else {
            currentPlayer = 1
        }
    }
    
    func playAgainstNPC() {//if bool is true and it's player 2 turn (this gets used in GameViewController)
        if GameSettings.shared.playAgainstComputer && currentPlayer == 2 {
        }
    }
    
    func checkForWinner() -> String? { //func to check for a winner through a for-loop.
        let winningPatterns: [[Int]] = [
               [0, 1, 2], [3, 4, 5], [6, 7, 8],
               [0, 3, 6], [1, 4, 7], [2, 5, 8],
               [0, 4, 8], [2, 4, 6]
           ]
        guard boardArray.count == 9 else {
                return "Invalid board configuration" //even more error handling
            }
        if GameSettings.shared.playAgainstComputer && currentPlayer == 2{
            if !boardArray.contains(""){
                return "It's a tie!"
            }
            return nil
        }
           for pattern in winningPatterns {
               let positions = pattern.map { boardArray[$0] }
               if positions == ["X", "X", "X"] {
                   countPLayer1 += 1
                   return "Player X wins!"
               } else if positions == ["O", "O", "O"] {
                   countPlayer2 += 1
                   return "Player O wins!"
               }
           }

           if !boardArray.contains("") {
               return "It's a tie!"
           }

           return nil
    }
    
  
    
    
    
}
