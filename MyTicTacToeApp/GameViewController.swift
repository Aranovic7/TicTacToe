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
    
    
    var boardArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Kod som ska köras direkt när controllern visas upp
        if (currentPlayer == 1) {
            turnSign.text = playerOneName
        } else if (playerOneName == "") {
            turnSign.text = "X"
            
        }
        
        
    }
    
    
    @IBAction func btnA1(_ sender: UIButton) {
        let currentTitle = sender.currentTitle
        var newTitle: String?
        if  currentTitle == "" && currentPlayer == 1{
            newTitle = "X"
        } else if (currentTitle == "" && currentPlayer == 2) {
            newTitle = "O"
        }
        sender.setTitle(newTitle, for: .normal)
            
        
    }
    
    


   
    @IBAction func boardTapAction(_ sender: UIButton) {
        // Vad ska hända när man trycker på en knapp?
        // Knappen ska visa en titel, alltså X eller O
        // Hur vet vi om den ska visa X eller O?
        // Beroende av vilken spelare det är som trycker så kan vi veta om det är X eller O som ska visas
        // Skapa en variabel för spelare 1 och spelare 2
        // Eller kanske bara en variabel
        // En variabel för currrent player, vi måste hålla koll på vems tur det är
        // Om vi skapar outlets för varje knapp, så kan vi kolla om knappen har en X symbol på sig, eller inte,
        // Om vi skapar en array med 9 siffror och varje siffra motsvarar en cell. Exempelvis att box nummer a1 har siffran 0 i vår array. Då kan jag checka att om vi har 0 i första siffran av vår array då är den tom, men om det står 1 så har spelare 1 lagt sin markering där,om det står 2 där då har spelare 2 lagt sin markering på a1. Exempelvis kan vår array se ut såhär: var board = [0, 0, 0, 0]. Sedan kanske man kan ha en funktion: func checkForWinner() {}
        /*
         Sedan kanske man har en funktion
         func checkForWinner() -> Bool {
            // Kolla första raden horizontellt
         if board[0] == board[1] && board[1] == board[2]
         return true
         // Vinst har upptäckts på rad 1
         // Sedan kan man ha så på andra och tredje raden
         // Kolla diagonalt 1
         if board[0] == board[4] && board[2] == board[8]
         return true
         // Vinst har upptäckts på diagonalt 1
         }
         return false
         }
         Viktigt att tänka på är att man inte ska vinna på tomma boxar så kan man skriva såhär istället:
         if board[0] != 0 && board[0] == board[1] && board[1] == board[2]
         */
        /* Men hur ska vi matcha själva komponenten dvs bilden/knappen med vår array, alltå index?
         Det man kan göra då är att när man har en komponent, exemeplvis en imageview, så kan man trycka på den och lägga in en tagg för att identifiera den. Detta tagg nummer kan man sedan få ut via en sender.
         Alltså kan man skapa en outlet för imageView, sedan lägga in en 'onTapGesture' i imageview och även skapa en outlet för 'onTapGesture', detta skulle då bli en funktion som följande:
         @IBAction func onTap (_ sender: UITapGestureRecoginzer) {
           
         }
         Notera att vår sender kan innehålla en tagg som vi kan ta fram:
         @IBAction func onTap (_ sender: UITapGestureRecoginzer) {
         
           if let myImage = sender.view as? UIImageView{
                myImage.
         }
           let tag = sender.view?.tag
         }
         Notera att en knapp inte behöver en onTapGesture
         /*
          Varje element motsvarar en bild i ordning från vänster. Om elementet är noll, så ska bilden vara square.
          Om elementet är ett, ska bilden vara X och om elementet är 2 ska bilden vara O.
          Så hur ska vi matcha vår array med bilderna?
          
          */
         
         var images = [0, 0, 0]
         
         @IBAction func onTap (_ sender: UITapGestureRecoginzer) {
         
           guard let tag = sender.view?.tag else [return]
            if images[tag] == 0 {
         // Om bilden är tom får vi lägga X där
                images[tag] == 1
         } if tag === 0 {
                imgOne.image = UIImage(systemNamed: "xmark")
         }
         
         */
        // Man kan skapa funktioner för olika saker exemeplvis: func switchPlayers(), func checkForWinner, func placeSymbol(atIndex: Int)
        // en viktig funktion för att placera användarens pjäs på boxen i brädan:
        /*
         var currentPlayer = 1
         
         func placeSymbol(atIndex: Int) {
         
         // Kolla först om boxen är tom
         if board[atIndex] == 0 {
                return
         }
         
         // placera användarens input i boxen
         
         board[atIndex] = currentPlayer
         
         }
         */
        
        
    }
    
}
