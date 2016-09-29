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
    // Image View object is a view not control. So, it can't initiate an action. It is created here as an outlet. Later, an tap gesture recognizer is assigned to the image view and that tap recognizer initiates the action based on user's interaction. The interaction can be swipe or tap. Now, this gesture recognizer initiates the action. The function initiated by the tap gesture is under Actions section named selectImageFromLibrary function.
    // Outlets are nothing but pointers in the controllers to store the references of the UI views.
    // Views: Label, Image View
    // Controls: Button, Textfield
    // Gesture recognizer is used to get the same functionality as Control which is not possible with views.
    
//    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var ratingControl: RatingControl!

    @IBOutlet weak var saveButton: UIBarButtonItem!
    var meal: Meal?
    
    
    // MARK: UITextFieldDelegate
    // The text field becomes the first responder when user clicks on it. When user types and clicks on the return or done button this method is called. Then the text field resigns being first responder.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // This method is called and it takes the text field content and updates the label.
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
    // SOme native methods which Image Picker Controllers might need to call are these 2 delegate methods.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // User might think of clicking on the Cancel button during the process of selecting image.
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
        
        // Depending on style of presentation (modal or push presentation), this view Contoroller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            // dismissing the adding meal functionality when user clicks on the add button
            dismiss(animated: true, completion: nil)
        }
        else{
            navigationController!.popViewController(animated: true)
        }
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
    // // At the tap of the image view, this method is called
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
         //Now, xcode wants to make sure that user is switching from typing. So, the textfield need to resign being first responder.
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // A new custom imagePickerController is created and stored in constant imagePickerController. It is created to take care of the process of selecting images from the photo library.
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        //
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // View Controller is the delegate for the imageViewController because it is defined in the View Controller's scope.
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        // The ViewCOntroller will present the imagePickerController in animated form.
        present(imagePickerController, animated: true, completion: nil)
    
    }
    
//    @IBAction func setDefaultLabelText(sender: UIButton) {
////        mealNameLabel.text = "Default Text"
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Set up views if editing an existing meal
        if let meal = self.meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        // Enable the save button only if the text field has a valid Meal name during implementation
        checkValidMealName()
    }

}

