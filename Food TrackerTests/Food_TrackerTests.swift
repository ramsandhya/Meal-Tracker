//
//  Food_TrackerTests.swift
//  Food TrackerTests
//
//  Created by Jitendra Ram on 9/2/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit
import XCTest
@testable import Food_Tracker

class Food_TrackerTests: XCTestCase {
    
    // FoodTrcaker Tests
    
    // Tests to confirm that the Meal initializer returns no name or a negative rating is provided.
    
    func testMealInitialization() {
        
        // Success case
        // This test will pass because the initialization of Meal object is possible ansd will not return nil.
        let potentialItem = Meal(name: "Newest Meal", photo: nil, rating:5)
        XCTAssertNotNil(potentialItem)
        
        // Failure Cases
        // This test will also pass because the intitialization of a New Meal object is not possible as there is no name. The absence of name will return nil as per the init definition. SO, XCTAssertNil is true.

        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid.")
        
        // This test case we are asserting that it will not return nil by XCTAssetNotNil but it will return nil because we've declared in the initiLIZATION THAT if the name is melty or rating is negative then return nil. So, it will return nil. SO this test case will fail.
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        
        // To let the above test pass XCTAssert should be NotNil because it sure will create a new Meal object.

        XCTAssertNil(badRating, "Negative ratings are invalid so put positive rating.")
    }
}
