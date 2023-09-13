import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtPlayerOne: UITextField!
    @IBOutlet weak var txtPlayerTwo: UITextField!
    @IBOutlet weak var btnNavigateToGame: UIButton!
    
    let TO_GAME_SCREEN = "toGameScreen"
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    

