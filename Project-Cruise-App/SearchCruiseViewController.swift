//
//  SearchCruiseViewController.swift
//  Project-Cruise-App
//
//  Created by Jawwad Abbasi on 2023-10-29.
//
// Team Members [ Jawwad(301298052), Habib(301279481) , and Muskan(301399676)]
// Milestone Number 2
// Submission date: OCT 30 2023

import UIKit

class SearchCruiseViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {

    
    let backgroundImageView = UIImageView()

    let searchController = UISearchController()
    @IBOutlet weak var cruiseTableView: UITableView!
    var cruiseList = [Cruise]()
    var filteredCruises = [Cruise]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        initList()
        initSearchController()

        // Do any additional setup after loading the view.
    }
    //setting background Image
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
    // Search controller code and custom filters
    func initSearchController()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Bahamas", "Caribbean", "Cuba", "Sampler", "star"]
        searchController.searchBar.delegate = self
    }
    
    // Hardcoded list of Cruises with their pictures and IDs
    
    func initList() {
        let bahamas = Cruise(id: "0", name: "Bahamas 1", imageName: "001_resized")
        cruiseList.append(bahamas)
        
        let Caribbean = Cruise(id: "1", name: "Caribbean 1", imageName: "002_resized")
        cruiseList.append(Caribbean)
        
        let Cuba = Cruise(id: "2", name: "Cuba 1", imageName: "003_resized")
        cruiseList.append(Cuba)
        
        let Sampler = Cruise(id: "3", name: "Sampler 1", imageName: "004_resized")
        cruiseList.append(Sampler)
        
        let star = Cruise(id: "4", name: "star 1", imageName: "005_resized")
        cruiseList.append(star)
        
        let bahamas2 = Cruise(id: "5", name: "Bahamas 2", imageName: "006_resized")
        cruiseList.append(bahamas2)
        
        let Caribbean2 = Cruise(id: "6", name: "Caribbean 2", imageName: "007_resized")
        cruiseList.append(Caribbean2)
        
        let Cuba2 = Cruise(id: "7", name: "Cuba 2", imageName: "008_resized")
        cruiseList.append(Cuba2)
        
        let Sampler2 = Cruise(id: "8", name: "Sampler 2", imageName: "009_resized")
        cruiseList.append(Sampler2)
        
        let star2 = Cruise(id: "9", name: "star 2", imageName: "010_resized")
        cruiseList.append(star2)
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive)
        {
            return filteredCruises.count
        }
        return cruiseList.count
    }
    
    // Displaying results in TableView Cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cruiseViewCell = tableView.dequeueReusableCell(withIdentifier: "cruiseViewCellID") as! SearchCruiseCell
        
        let thisCruise : Cruise!
        if (searchController.isActive)
        {
            thisCruise = filteredCruises[indexPath.row]
        }
        else
        {
            thisCruise = cruiseList[indexPath.row]

        }
        cruiseViewCell.cruiseName.text = thisCruise.id + " " + thisCruise.name
        cruiseViewCell.cruiseImage.image = UIImage(named: thisCruise.imageName)
        
        return cruiseViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            self.performSegue(withIdentifier: "detailSegue", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "detailSegue")
        {
            let indexPath = self.cruiseTableView.indexPathForSelectedRow!
            
            let tableViewDetail = segue.destination as? CruiseViewDetails
            
            let  selectedCruise : Cruise!
            
            if(searchController.isActive)
            {
                selectedCruise = filteredCruises[indexPath.row]
            }
            else
            {
                selectedCruise = cruiseList[indexPath.row]
            }
            tableViewDetail!.selectedCruise = selectedCruise
            
            self.cruiseTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton : String = "All")
    {
        filteredCruises = cruiseList.filter
        {
            shape in
            let scopeMatch = (scopeButton == "All" || shape.name.lowercased().contains(scopeButton.lowercased()))
            if(searchController.searchBar.text != "")
            {
                let searchTextMatch = shape.name.lowercased().contains(searchText.lowercased())
                
                return scopeMatch && searchTextMatch
            }
            else
            {
                return scopeMatch
            }
        }
        cruiseTableView.reloadData()
    }
    

}
