//
//  Cruise.swift
//  Project-Cruise-App
//
//  Created by Jawwad Abbasi on 2023-10-29.
//
// Team Members [ Jawwad(301298052), Habib(301279481) , and Muskan(301399676)]
// Milestone Number 2
// Submission date: OCT 30 2023
// A custom class made for Cruise details
import Foundation

class Cruise{
    
    var id : String!
    var name : String!
    var imageName : String!

    
    public init(id:String, name:String, imageName:String)
    {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}
