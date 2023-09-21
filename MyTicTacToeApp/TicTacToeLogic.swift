import Foundation
import UIKit

class TicTacToeLogic {
    var currentPlayer: Int = 1
    var playerOneName: String?
    var playerTwoName: String?
    var boardArray = ["", "", "", "", "", "", "", "", ""]
    var countPlayer1 = 0
    var countPlayer2 = 0
    var winner: String?
    var playAgainstComputer = false
    
    
    func switchPlayers() {
        if currentPlayer == 1 {
            currentPlayer = 2
        } else {
            currentPlayer = 1
        }
    }
    
    func makeMove(at index: Int, withButton button: UIButton, andTurnSignLabel turnSign: UILabel ) {
        if boardArray[index] == "" {
            
            if currentPlayer == 1 {
                boardArray[index] = "X"
            } else {
                boardArray[index] = "O"
            }
            
            button.setTitle(boardArray[index], for: .normal)
            
            switchPlayers()
            
            if currentPlayer == 1 {
                turnSign.text = playerOneName
            } else {
                turnSign.text = playerTwoName
            }
            if playAgainstComputer && currentPlayer == 2 {
                makeComputerMove()
            }
            
        }
        
        func checkForWinner() -> String? {
            let winningPatterns: [[Int]] = [
                [0, 1, 2], [3, 4, 5], [6, 7, 8],
                [0, 3, 6], [1, 4, 7], [2, 5, 8],
                [0, 4, 8], [2, 4, 6]
            ]
            
            if playAgainstComputer && currentPlayer == 2 {
                if !boardArray.contains("") {
                    return "It's a tie!"
                }
                return nil
            }
            for pattern in winningPatterns {
                let positions = pattern.map { boardArray[$0] }
                if positions == ["X", "X", "X"] {
                    if GameSettings.shared.playAgainstComputer {
                        if currentPlayer == 1 {
                            countPlayer1 += 1
                        }
                        return "Congrats \(playerOneName ?? "X"), you won!"
                    } else {
                        print("Before currentPlayer update: \(currentPlayer)")
                        countPlayer1 += 1
                        return "Congrats \(playerOneName ?? "X"), you won!"
                    }
                } else if positions == ["O", "O", "O"] {
                    if GameSettings.shared.playAgainstComputer {
                        countPlayer2 += 1
                        return "Congrats \(playerTwoName ?? "O"), you won!"
                    }
                    
                }
            }
            
            func makeComputerMove() {
                var emptySpots = [Int]()
                for (index, value) in boardArray.enumerated() {
                    if value.isEmpty {
                        emptySpots.append(index)
                    }
                }
                
                if let randomIndex = emptySpots.randomElement() {
                    boardArray[randomIndex] = "O"
                }
            }
            
            func playAgainstNPC() {
                if playAgainstComputer && currentPlayer == 2 {
                    makeComputerMove()
                }
            }
            
            
        }
    }
}
