//
//  FriendsTVC.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/16/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import UIKit

class FriendsTVC: UITableViewController {
    
    //    var friendsList = [Friend(name: "Andriy", imageName: "picAndrey"),
    //                       Friend(name: "Jack", imageName: "picJack"),
    //                       Friend(name: "Rockefeler", imageName: "picRockefeler")]
    //
    //    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getFriends().count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FRIEND_CELL, for: indexPath) as? FriendCell {
            let friend = DataService.instance.getFriends()[indexPath.row]
            
            //images.append(friendsList[indexPath.row].imageName)
            cell.configureCell(for: friend)
            return cell
        } else {
            return FriendCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = DataService.instance.getFriends()[indexPath.row]
        performSegue(withIdentifier: TO_FRIENDS_PICTURES, sender: friend)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataService.instance.removeFriend(indexPath)
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
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? FriendPicturesCVC {
            // assert(sender as? Friend != nil)
            if let friend = sender as? Friend {
                destinationVC.intitImages(for: friend)
            }
        }
    }
}
