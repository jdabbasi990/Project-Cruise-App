//
//  AuthenticationViewController.swift
//  Project-Cruise-App
//
//  Created by Jawwad Abbasi on 2023-10-29.
//

import UIKit

class AuthenticationViewController: UIViewController {
    let backgroundImageView = UIImageView()

    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var fullNameTextField: CustomTextField!
    @IBOutlet weak var confirmPassword: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()


        // Do any additional setup after loading the view.
        fullNameTextField.isHidden = true
        confirmPassword.isHidden = true
        
    }
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

    @IBAction func onDisplayResteration(_ sender: Any) {
        fullNameTextField.isHidden = !fullNameTextField.isHidden
        confirmPassword.isHidden = !confirmPassword.isHidden
    }
    

}
