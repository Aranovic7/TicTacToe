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
    var countWinner: [String: Int] = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Code that will run directly when controller shows
        
        // If it's player 1's turn -> update our labelSign text
        if (currentPlayer == 1) {
            turnSign.text = playerOneName
        } else {
            turnSign.text = playerTwoName
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
                
            } else {
                boardArray[index] = "O"
            }
            
            sender.setTitle(boardArray[index], for: .normal)
            
            currentPlayer = 3 - currentPlayer
            
            if currentPlayer == 1 {
                turnSign.text = playerOneName
            } else {
                turnSign.text = playerTwoName
            }
            
            if let winnerMessage = checkForWinner() {
                self.winner = winnerMessage
                myAlertMessage(winnerMessage: winnerMessage)
            } else if !boardArray.contains("") {
                myAlertMessage(winnerMessage: "It's a tie!")
            }
            
            
        }
        
    }
    
    
    func checkForWinner() -> String? {
        let winningPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horisontalt
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Verticalt
            [0, 4, 8], [2, 4, 6] // Diagonalt
        ]
        for pattern in winningPatterns {
            let positions = pattern.map { boardArray[$0] }
            if positions == ["X", "X", "X"] {
                countWinner["Crosses", default: 0] += 1
                return "Congrats \(playerOneName ?? "X"), you won!"
            } else if positions == ["O", "O", "O"] {
                countWinner["Noughts", default: 0] += 1
                return "Congrats \(playerTwoName ?? "O"), you won!"
            }
            
        }
        
        if boardArray.contains("") {
            return nil
        } else {
            return "Oh, it's a beutiful tie!"
        }
    }
    
    func myAlertMessage(winnerMessage: String) {
        let crossesCount = countWinner["Crosses"] ?? 0
        let noughtsCount = countWinner["Noughts"] ?? 0
        
        let crossesText = "Crosses: \(crossesCount)"
        let noughtsText = "Noughts: \(noughtsCount)"
        
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
    
    func resetGame() {
        boardArray = ["", "", "", "", "", "", "", "", ""]
        for button in buttons {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        currentPlayer = 1
        turnSign.text = playerOneName
    }
    
    func dismissGame() {
        dismiss(animated: true, completion: nil)
    }
    
}
