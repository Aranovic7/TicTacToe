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
    var currentGameStatus: String = "X"
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
            turnSign.text = "X"
            
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
    }
    }

