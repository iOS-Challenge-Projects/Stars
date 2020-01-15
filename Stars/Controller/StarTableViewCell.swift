//
//  StarTableViewCell.swift
//  Stars
//
//  Created by FGT MAC on 1/15/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var star: Star? {
        didSet{
            updateViews()
        }
    }
    
   private func updateViews(){
    
    guard let name = star?.name, let distance = star?.distance else {return}
    
    nameLabel.text = name
    distanceLabel.text = String(distance)
    
    }
    
}
