import UIKit

class SecondViewController: UIViewController {

    let TO_GAME_SCREEN = "toGameScreen"
    var playAgainstComputer = GameSettings.shared.playAgainstComputer
  
    
    
    @IBOutlet weak var txtPlayerOne: UITextField!
    @IBOutlet weak var txtPlayerTwo: UITextField!
    @IBOutlet weak var btnNavigate: UIButton!
    @IBOutlet weak var btnPlayNPC: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtPlayerOne.text = ""
        txtPlayerTwo.text = ""
    }
    
    @IBAction func btnNavigate(_ sender: UIButton) {
        GameSettings.shared.playAgainstComputer = false
        performSegue(withIdentifier: TO_GAME_SCREEN, sender: self)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == TO_GAME_SCREEN {
            
            if let destinationVC = segue.destination as? GameViewController {
                
                guard let txtPlayerOne = txtPlayerOne.text else {return}
                guard let txtPlayerTwo = txtPlayerTwo.text else {return}
                
                destinationVC.playerOneName = txtPlayerOne.isEmpty ? "X" : txtPlayerOne
                destinationVC.playerTwoName = txtPlayerTwo.isEmpty ? "O" : txtPlayerTwo
            }
        }
    }
    
    
    @IBAction func btnPlayNPC(_ sender: UIButton) {
        GameSettings.shared.playAgainstComputer = true
        txtPlayerOne.text = "Player"
        txtPlayerTwo.text = "Computer"
        performSegue(withIdentifier: TO_GAME_SCREEN, sender: self)
    }
    
}
    

