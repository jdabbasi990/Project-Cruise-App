import Foundation
import UIKit

class CruiseViewDetails : UIViewController{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var selectedCruise : Cruise!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = selectedCruise.id + " - " + selectedCruise.name
        image.image = UIImage(named: selectedCruise.imageName)
    }
}
