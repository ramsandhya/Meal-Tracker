//
//  Meal.swift
//  Food Tracker
//
//  Created by Jitendra Ram on 9/18/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
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

}


