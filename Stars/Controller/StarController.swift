//
//  StarController.swift
//  Stars
//
//  Created by FGT MAC on 1/15/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

class StarController {
    
    //Here we call the load method in the initializer
    //So as soon as the instance of this class gets call in the StarsViewController it will load the data 
    init() {
        loadFromPersistantStore()
    }
    
    //private(set) means that it can only be set inside the class (in this case by the method below)
    private(set) var stars: [Star] = []
    
    //Creating the path to the location where we want to persist our stars
    //Using a private computed property
    private var persistentFileURL: URL? {
        
        //accesing the iOS file system
        let fileManager = FileManager.default
        
        //Here we are going inside of the documents directory of the iOS device
        guard let document =  fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        //here we create a plist with the name of stars
        return document.appendingPathComponent("stars.plist")
    }
    
    
    //Create a star
    //@discardableResult means that you are not require to use the return value
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        
        //Create a star using the Star struct
        let star = Star(name: name, distance: distance)
        
        //append it to the private variable
        stars.append(star)
        
        saveToPersistentStore()
        
        return star
    }
    
    
    func saveToPersistentStore() {
        
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            
            let data = try encoder.encode(stars)
            
            try data.write(to: url)
        }catch{
            print("Error saving data: \(error)")
        }
        
    }
    
    func loadFromPersistantStore() {
        let fileManager = FileManager.default
        
        guard let url = persistentFileURL,  fileManager.fileExists(atPath: url.path) else { return }
            
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading data from persistant storage: \(error)")
        }
    }
    
}

