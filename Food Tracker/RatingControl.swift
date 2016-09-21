//
//  RatingControl.swift
//  Food Tracker
//
//  Created by Jitendra Ram on 9/17/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0{
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var spacing = 5
    var starCount = 5
    
    
    

    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
      
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount{
            let button = UIButton()
            button.setImage(emptyStarImage, for: UIControlState())
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
//            button.backgroundColor = UIColor.redColor()
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews(){
        
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        //Offset each button's origin by the length of the button plus spacing
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        //It’s important to update the button selection states when the view loads, not just when the rating changes.
        updateButtonSelectionStates()
    }

    
    override var intrinsicContentSize : CGSize {
        let buttonsize = Int(frame.size.height)
        let width = (buttonsize * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonsize)
    }
    
    
    // MARK: Button Action
    
    func ratingButtonTapped(_ button: UIButton) {
//        print("Button pressed")
        rating = ratingButtons.index(of: button)! + 1
        
        //It’s important to update the button selection states when the view loads, not just when the rating changes.
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated(){
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
}
