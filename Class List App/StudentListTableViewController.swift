//
//  StudentListTableViewController.swift
//  Class List App
//
//  Created by Justin Acevedo on 9/13/19.
//  Copyright © 2019 CS-337. All rights reserved.
//

import UIKit

class StudentListTableViewController: UITableViewController {
    
    var studentModel = StudentModel()
    var csseStudentList:[studentInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let list = studentModel.getAllStudents() {
            csseStudentList = list
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return csseStudentList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentData", for: indexPath)

        // Configure the cell...
        
        let student = csseStudentList[indexPath.row]
        
        
        cell.textLabel?.text = student["Student Name"]!  + " - " + student["Class"]!
        cell.detailTextLabel?.text = student["Major"]! + " " + student["Email"]!
        
        //configure the photos
        
        let imgName = student["ID"]! + ".jpg"
        if let img = UIImage(named: imgName), let resizedImg = img.resizeTheImage(image: img , newHeight: 40 ){
            cell.imageView?.image = resizedImg
        } else {
            cell.imageView?.image = UIImage(named: "student.jpg")
        }

        return cell
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Students"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
