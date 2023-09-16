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
            
            if let winner = checkForWinner() {
                self.winner = winner
                print("HELLO")
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
                return "Player One win!"
            } else if positions == ["O", "O", "O"] {
                return "Player two win!"
            }
        }
        if boardArray.contains("") {
            return nil
        } else {
            return "Oavgjort!"
        }
    }
    
}
