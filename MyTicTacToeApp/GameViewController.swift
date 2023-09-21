import UIKit


class GameViewController: UIViewController {
    
    // All my outlets
    @IBOutlet weak var turnSign: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var currentPlayer: Int = 1 // To keep track of player
    var playerOneName: String? // To store player one name in variable
    var playerTwoName: String? // To store player two name in variable
    var winner: String?
    var boardArray = ["", "", "", "", "", "", "", "", ""] // An array of empty strings
    var countPlayer1 = 0
    var countPlayer2 = 0
    let playAgainstComputer = GameSettings.shared.playAgainstComputer
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardArray = ["", "", "", "", "", "", "", "", ""]
        
        // If it's player 1's turn -> update our labelSign text
        if (currentPlayer == 1) {
            turnSign.text = playerOneName
        } else {
            turnSign.text = playerTwoName
        }
    }
    
    func switchPlayers() {
        if currentPlayer == 1 {
            currentPlayer = 2
        } else {
            currentPlayer = 1
        }
    }
    
    /**
     In this function I want to set a  title on a button and then switch turn when a button is pressed
     All the buttons are attached to this function so that "let index" will include same terms for all my buttons
     **/
    @IBAction func buttonTapped(_ sender: UIButton) {
        let index = sender.tag
        if boardArray[index] == "" {
            if currentPlayer == 1 {
                boardArray[index] = "X"
                sender.setTitle("X", for: .normal)
            } else {
                boardArray[index] = "O"
                sender.setTitle("O", for: .normal)
            }
            
            sender.setTitle(boardArray[index], for: .normal)
            
            switchPlayers()
            
            if currentPlayer == 1 {
                turnSign.text = playerOneName
            } else {
                turnSign.text = playerTwoName
            }
            
            if let winnerMessage = checkForWinner() {
                self.winner = winnerMessage
                myAlertMessage(winnerMessage: winnerMessage)
            }
        } else if !boardArray.contains("") {
            myAlertMessage(winnerMessage: "It's a tie!")
        }
        if GameSettings.shared.playAgainstComputer && currentPlayer == 2 {
            playAgainstNPC()
        }
        
    }
    
    // A function to check for a winner
    func checkForWinner() -> String? {
        let winningPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
        
        if GameSettings.shared.playAgainstComputer && currentPlayer == 2 {
            if !boardArray.contains("") {
                return "It's a tie!"
            }
            return nil
        }
        for pattern in winningPatterns {
            let positions = pattern.map { boardArray[$0] }
            if positions == ["X", "X", "X"] {
                countPlayer1 += 1
                return "Congrats \(playerOneName ?? "X"), you won!"
            } else if positions == ["O", "O", "O"] {
                    countPlayer2 += 1
                    return "Congrats \(playerTwoName ?? "O"), you won!"
                }
            }
        
                if boardArray.contains("") {
                    return nil
                } else {
                    return "Oh, it's a beutiful tie!"
                }
            }
            
            // This i my alert message after every win/tie
            func myAlertMessage(winnerMessage: String) {
                
                let crossesText = "Crosses: \(countPlayer1)"
                let noughtsText = "Noughts: \(countPlayer2)"
                
                let messageText = "Do you wanna play again?\n\n\(crossesText)\n\(noughtsText)"
                
                let myAlertController = UIAlertController(title: winnerMessage, message: messageText, preferredStyle: .alert)
                let yesAction = UIAlertAction(title: "Yes", style: .default) {_ in
                    self.resetGame()
                }
                let noAction = UIAlertAction(title: "No", style: .cancel) {_ in
                    self.dismissGame()
                }
                
                myAlertController.addAction(yesAction)
                myAlertController.addAction(noAction)
                
                present(myAlertController, animated: true, completion: nil)
            }
            
            // This function allows me to close the game in GameViewController and go back to SecondViwController
            func dismissGame() {
                dismiss(animated: true, completion: nil)
                
            }
            
            // This function resets the game and prepare for a new game
            func resetGame() {
                boardArray = ["", "", "", "", "", "", "", "", ""]
                for button in buttons {
                    button.setTitle("", for: .normal)
                    button.isEnabled = true
                }
                currentPlayer = 1
                turnSign.text = playerOneName
            }
            
            func makeComputerMove() {
                var emptySpots = [Int]()
                for (index, value) in boardArray.enumerated() {
                    if value.isEmpty {
                        emptySpots.append(index)
                    }
                }
                
                if let randomIndex = emptySpots.randomElement(){
                    let buttonToPress = buttons[randomIndex]
                    buttonTapped(buttonToPress)
                }
            }
            
            /*
             This function controlls if the game is between a user and computer
             If it's true, it allows the computer to make a move
             */
            func playAgainstNPC() {
                if GameSettings.shared.playAgainstComputer && currentPlayer == 2 {
                    makeComputerMove()
                }
            }
            
        }
    
