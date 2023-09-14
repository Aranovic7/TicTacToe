import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var turnSign: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var currentPlayer: Int = 1
    var isPlaying = false
    var playerOneName: String?
    var playerTwoName: String?
    
    
    var boardArray = ["", "", "", "", "", "", "", "", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Kod som ska köras direkt när controllern visas upp
        if (currentPlayer == 1) {
            turnSign.text = playerOneName
        } else if (playerOneName == "") {
            turnSign.text = "Player X turn"
            
        }
        if (currentPlayer == 2) {
            turnSign.text = playerTwoName
        } else if (playerTwoName == "") {
            turnSign.text = "Player O turn"
            }
        
        
        }
        
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let index = sender.tag // knapparna har en tagg som motsvarar deras position i boardArray
        if boardArray[index] == "" {
            if currentPlayer == 1 {
                boardArray[index] = "X"
            } else {
                boardArray[index] = "O"
            }
            
            sender.setTitle(boardArray[index], for: .normal)
            
            currentPlayer = 3 - currentPlayer
        }
        
        if let winner = checkForWinner() {
            turnSign.text = winner
        } else {
            currentPlayer = 3 - currentPlayer
            if (currentPlayer == 1) {
                turnSign.text = playerOneName
            } else {
                turnSign.text = playerTwoName
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
