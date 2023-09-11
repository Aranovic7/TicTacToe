import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnNavigate: UIButton!
    
    let ToSecondScreenSegue = "ToSecondScreenSegue"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func btnNavigate(_ sender: UIButton) {
        performSegue(withIdentifier: ToSecondScreenSegue, sender: self)
    }
    
    
    

}

