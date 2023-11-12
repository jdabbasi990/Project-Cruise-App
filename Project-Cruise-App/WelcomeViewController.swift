//
//  ViewController.swift
//  Project-Cruise-App
//
//  Created by Jawwad Abbasi on 2023-10-25.
//

import UIKit

class WelcomeViewController: UIViewController {

    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
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
}

