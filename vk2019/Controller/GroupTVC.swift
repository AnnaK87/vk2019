//
//  GroupTVC.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/19/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import UIKit

class GroupTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(DataService.instance.getGroups())
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 1
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getGroups().count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GROUP_CELL, for: indexPath) as? GroupCell {
            let group = DataService.instance.getGroups()
            cell.configureCell(for: group[indexPath.row])
            return cell
        } else {
            return GroupCell()
        }
    }
    
    
    @IBAction func addGroup(segue: UIStoryboardSegue!) {
        if segue.identifier == ADD_GROUP {
            let newGroupsController = segue.source as! NewGroupTVC
            if let indexPath = newGroupsController.tableView.indexPathForSelectedRow {
                let newGroup = DataService.instance.getNewGroup()[indexPath.row]
                let contains = DataService.instance.getGroups().contains { group -> Bool in
                    if group.name == newGroup.name {
                        return true
                    } else {
                        return false
                    }
                }
                guard !contains else { return }
                    DataService.instance.appendGroup(with: newGroup)
                    tableView.reloadData()
                
            }
        }
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataService.instance.removeGroup(indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
