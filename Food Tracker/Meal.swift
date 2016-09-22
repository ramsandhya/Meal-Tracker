//
//  Meal.swift
//  Food Tracker
//
//  Created by Jitendra Ram on 9/18/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "X"
        static let photoKey = "Y"
        static let ratingKey = "Z"
    }
    
    // MARK: Initializer
    init?(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(photo, forKey: PropertyKey.photoKey)
        aCoder.encode(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder: NSCoder){
        let name = coder.decodeObject(forKey: PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = coder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        
        let rating = coder.decodeInteger(forKey: PropertyKey.ratingKey)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)

    }
}


