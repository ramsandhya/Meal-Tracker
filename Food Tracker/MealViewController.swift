//
//  MealViewController.swift
//  Food Tracker
//
//  Created by Jitendra Ram on 9/2/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
//    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var ratingControl: RatingControl!

    @IBOutlet weak var saveButton: UIBarButtonItem!
    var meal: Meal?
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func  textFieldDidEndEditing(_ textField: UITextField) {
//        mealNameLabel.text = textField.text
        checkValidMealName()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the save button while editing
        saveButton.isEnabled = false
    }
    
    func checkValidMealName() {
        // Disable the Save Button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // DIsmiss the picker if the user cancelled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display selected image
        photoImageView.image = selectedImage
        
        // Dismiss the image picker
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    
    }

    
    // This method lets you configure a view controller before its presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // saveButton is the sender of segue. Sender can be Any object as per the parameter sender: Any?. So, it needs to be downcast when used ina function using as! operator.
        // name photo and rating constants are being assingned to the data eneterd by user. This constant has a scope locally and can be edited using the edit feature later on, so using let doesn't matter. var holds a complex memory management than let.
        // saveButton is a reference to the sender. SO we need to check if saveButton is of type
        // Other option:
        // if let btn = sender as? UIBarButtonItem, let title = btn.title  {
        //  if title == "Save" {
        if saveButton === sender as? UIBarButtonItem {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealTableViewCOntroller after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating)
                
        }
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    
    }
    
//    @IBAction func setDefaultLabelText(sender: UIButton) {
////        mealNameLabel.text = "Default Text"
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Enable the save button only if the text field has a valid Meal name during implementation
        checkValidMealName()
    }

}

