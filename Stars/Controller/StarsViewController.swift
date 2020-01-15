//
//  ViewController.swift
//  Stars
//
//  Created by FGT MAC on 1/14/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {
    
    let starController = StarController()
    
    @IBOutlet weak var starNameLabel: UITextField!
    @IBOutlet weak var distanceLabel: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    //MARK: - IBActions
    
    @IBAction func printStars(_ sender: UIButton) {
    }
    
    @IBAction func createStar(_ sender: UIButton) {
        
        //validating entries
        guard let name = starNameLabel.text, let distanceString = distanceLabel.text, !name.isEmpty, !distanceString.isEmpty, let distance = Double(distanceString) else { return }
        
        //Now we can call the method to create a star
        starController.createStar(named: name, withDistance: distance)
        
        //clear fields
        starNameLabel.text = ""
        distanceLabel.text = ""
        
        //put the curser back in the nameTextField
        starNameLabel.becomeFirstResponder()
        
        //Reload table view after creating new entry
        tableView.reloadData()
    }
}

extension StarsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else { return UITableViewCell() }
        
        let star = starController.stars[indexPath.row]
        
        cell.star = star
        
        return cell

    }
    
    
}
