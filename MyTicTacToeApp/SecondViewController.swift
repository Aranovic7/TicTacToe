/**
 This class is primarily responsible for collecting and validating
 player names and settings before navigating to the game screen.
 ***/

import UIKit

class SecondViewController: UIViewController {

    //all my global variables
    let TO_GAME_SCREEN = "toGameScreen"
    var playAgainstComputer = GameSettings.shared.playAgainstComputer
    var logicAndRules = LogicAndRules()
    
  
    //all my outlets
    @IBOutlet weak var txtPlayerOne: UITextField!
    @IBOutlet weak var txtPlayerTwo: UITextField!
    @IBOutlet weak var btnNavigate: UIButton!
    @IBOutlet weak var btnPlayNPC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    //to reset the textViews
    override func viewDidAppear(_ animated: Bool) {
        txtPlayerOne.text = ""
        txtPlayerTwo.text = ""
    }
    
    @IBAction func btnNavigate(_ sender: UIButton) { //button on press -> check for valid name and segue navigation
        GameSettings.shared.playAgainstComputer = false
        guard let playerOneName = txtPlayerOne.text, !playerOneName.isEmpty, !isNumeric(input: playerOneName) else {
                
                showAlert(message: "Invalid player name for Player 1")
                return
            }
        guard let playerTwoName = txtPlayerTwo.text, !playerTwoName.isEmpty, !isNumeric(input: playerTwoName) else {
              
              showAlert(message: "Invalid player name for Player 2")
              return
          }

        performSegue(withIdentifier: TO_GAME_SCREEN, sender: self)
    }
    
    func isNumeric(input: String) -> Bool {
        return Int(input) != nil
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //function to pass data to destination GameViewController
        
        if segue.identifier == TO_GAME_SCREEN {
            
            if let destinationVC = segue.destination as? GameViewController {
                
                guard let txtPlayerOne = txtPlayerOne.text else {return}
                guard let txtPlayerTwo = txtPlayerTwo.text else {return}
                
                destinationVC.logicAndRules.playerOneName = txtPlayerOne.isEmpty ? "X" : txtPlayerOne
                destinationVC.logicAndRules.playerTwoName = txtPlayerTwo.isEmpty ? "O" : txtPlayerTwo
            }
        }
    }
    
    
    @IBAction func btnPlayNPC(_ sender: UIButton) { // Button on press -> set player name's and bool to true
        GameSettings.shared.playAgainstComputer = true
        txtPlayerOne.text = "Player"
        txtPlayerTwo.text = "Computer"
        performSegue(withIdentifier: TO_GAME_SCREEN, sender: self)
    }
    
}
    

