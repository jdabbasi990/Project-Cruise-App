//
//  ViewController.swift
//  Project-Cruise-App
//
//  Created by Jawwad Abbasi on 2023-10-25.
// Team Number
// Team Members [ Jawwad(301298052), Habib(301279481) , and Muskan(301399676)]
// Milestone Number 2
// Submission date: OCT 30 2023

import UIKit

class WelcomeViewController: UIViewController {

    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
    
    // A custom function to which sets an image as a background
    
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

