//
//  MealTableViewController.swift
//  Food Tracker
//
//  Created by Jitendra Ram on 9/19/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController  {
    
    var meals = [Meal]()

    func loadSampleMeals(){
        
        let photo1 = UIImage(named: "meal1")
        let meal1 = Meal(name: "Citrus Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2")
        let meal2 = Meal(name: "Avocado salad", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "meal3")
        let meal3 = Meal(name: "Cheesecake", photo: photo3, rating: 3)!
        
        meals += [meal1, meal2, meal3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provoded by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Load any saved meals.
        if let savedMeals = loadMeals() {
            meals += savedMeals
        }
        // otherwise load sample data
        else {
        // Load the sample data
           loadSampleMeals()
        }
        
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Table view cells are reused and should be dequed using a cell identifier
        
        // Configure the cell...
        // Define value of cellIdentifier. We have defined the cellIdentifier In the Attributes section earlier.
        let cellIdentifier = "MealTableViewCell"
        let meal = meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MealTableViewCell
        
        // We need to feed the meal data to the cell data.
        cell.nameLabel.text = meal.name
        cell.photoImagevIew.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    // @IBAction is a special annotation which can be used to bind the function with some event. When save button is clicked this func is called.
    /*
     The first line inside the (second if statement) updates the appropriate entry in meals to store the updated meal information. The second line reloads the appropriate row in the table view to display the changed data.
     */
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                // Update an existing meal
                meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
            // unwindToMealList method is called when the user either saves or cancels the the process. This code mentions the steps when user saves the meal.
            // A new index is created where a new meal will be inserted
            // a new meal is appended to the Meal array
            // The new row is inserted inthe table view from bottom.
            // Add a new meal
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
            saveMeals()
        }
    }

    // Additional delegate method to support editing
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    // To perform any sort of editing on the table view we need to take help of its delegate methods
    // meal.remove method removes the corresponding Meal object(corresponding row) from the meal array- data model
    // Delegate method "commit editingStyle" is in charge of managing the table rows when it is in the editing mode
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            meals.remove(at: indexPath.row)
            saveMeals()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /* This method prepares for the segue process 
     We need to differentiate segue with the Identifier so that we know if the segue is happening from the Save button(to add a new meal) or from the tableView cell(to edit the existing meal)
     If the segue is to edit 
        then we identify the destination ViewController - which is mealDetailController
        we identify the cell which user clicked to edit and save it to selectedMealCell
        we identify the index by passing the cell as a parameter and save it to indexPath
        we indentify the meal by passing the index of the meal as a parameter and save it to selectedMeal
        we assign that meal object to the meal property of the mealDetailController which is MealViewController
     Else if the segue is to add a new meal then the process is defined in the prepare method in MealViewController
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let mealDetailController = segue.destination as! MealViewController
            
            // Get the cell that generated the segue
            if let selectedMealCell = sender as? MealTableViewCell{
                let indexPath = tableView.indexPath(for: selectedMealCell)!
                let selectedMeal = meals[(indexPath.row)]
                mealDetailController.meal = selectedMeal
            }
        }
        else if segue.identifier == "AddItem" {
           print("Adding a new meal.")
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: NSCoding
    func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save meals.")
        }
    }
    
    func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal]
    }
    
}










