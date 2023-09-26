/**
 This class is responsible for managing the gameplay
 It handles player moves, computer moves, displaying alert messages, resetting the game and so on..
 **/

import UIKit

class GameViewController: UIViewController {
    
    // All my outlets
    @IBOutlet weak var turnSign: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
   // All my global variables
    let playAgainstComputer = GameSettings.shared.playAgainstComputer
    var logicAndRules = LogicAndRules()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if currentPlayer is 1 then switch player and update turnSign label
        if (logicAndRules.currentPlayer == 1) {
            turnSign.text = logicAndRules.playerOneName
        } else {
            turnSign.text = logicAndRules.playerTwoName
        }
    }
    
    func switchPlayers() { //a function imported from LogicAndRules class
        logicAndRules.switchPlayers()
    }
    
    
    func resetGame() { //to reset the game
        
        logicAndRules.boardArray = ["", "", "", "", "", "", "", "", ""]
        
        for button in buttons {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        logicAndRules.currentPlayer = 1
        turnSign.text = logicAndRules.playerOneName
    }
    
    func makeComputerMove() {//allows computer to make a move on random index if bool is true
        var emptySpots = [Int]()
        for (index, value) in logicAndRules.boardArray.enumerated(){
            if value.isEmpty{
                emptySpots.append(index)
            }
        }
        if let randomIndex = emptySpots.randomElement(){
            let buttonToPress = buttons[randomIndex]
            buttonTapped(buttonToPress)
        }
    }
    
    func playAgainstNPC() {//function to call to play against npc
        logicAndRules.playAgainstNPC()
        makeComputerMove()
    }
    
    func myAlertMessage(winnerMessage: String){
        let crossesText = "Crosses: \(logicAndRules.countPLayer1)"
        let noughtsText = "Noughts: \(logicAndRules.countPlayer2)"
        
        let messageText = "Do you wanna play again?\n\n\(crossesText)\n\(noughtsText)"
        
        let myAlertController = UIAlertController(title: winnerMessage, message: messageText, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default){_ in
            self.resetGame() //to start a new round
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel){_ in
            if let navigationController = self.navigationController { //to navigate back to SecondViewController
                navigationController.popViewController(animated: true)
            }
        }
        
        myAlertController.addAction(yesAction)
        myAlertController.addAction(noAction)
        
        present(myAlertController, animated: true, completion: nil)
    }

   //on button tapped -> update title for button -> switch players -> check for a winner
    @IBAction func buttonTapped(_ sender: UIButton) {
        let index = sender.tag
        if logicAndRules.boardArray[index] == ""{
            if logicAndRules.currentPlayer == 1 {
                logicAndRules.boardArray[index] = "X"
                sender.setTitle("X", for: .normal)
            } else {
                logicAndRules.boardArray[index] = "O"
                sender.setTitle("O", for: .normal)
            }
            
            sender.setTitle(logicAndRules.boardArray[index], for: .normal)
            
            logicAndRules.switchPlayers()
            
            if logicAndRules.currentPlayer == 1 {
                turnSign.text = logicAndRules.playerOneName
            } else {
                turnSign.text = logicAndRules.playerTwoName
            }
            
            if let winnerMessage = logicAndRules.checkForWinner() {
                logicAndRules.winner = winnerMessage
                myAlertMessage(winnerMessage: winnerMessage)
            }
        } else if !logicAndRules.boardArray.contains("") {
            myAlertMessage(winnerMessage: "It's a tie!")
        }
        if GameSettings.shared.playAgainstComputer && logicAndRules.currentPlayer == 2 {
            playAgainstNPC()
        }
        
    }
}
