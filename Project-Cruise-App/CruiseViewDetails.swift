// Team Members [ Jawwad(301298052), Habib(301279481) , and Muskan(301399676)]
// Milestone Number 2
// Submission date: OCT 30 2023// Team Members [ Jawwad(301298052), Habib(301279481and Muskan(301399676)]
// Milestone Number 2
// Submission date: OCT 30 2023
import Foundation
import UIKit

class CruiseViewDetails : UIViewController{
    let backgroundImageView = UIImageView()

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var selectedCruise : Cruise!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // String format for displaying cruise details on cruise view screen
        name.text = selectedCruise.id + " - " + selectedCruise.name
        image.image = UIImage(named: selectedCruise.imageName)
    }
    // Setting background Image
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "secondary_background2")
        view.sendSubviewToBack(backgroundImageView)
    }
}
