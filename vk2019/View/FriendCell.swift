//
//  FirendCell.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/16/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func configureCell(for friend: Friend) {
        friendName.text = friend.name
        friendImage.image = UIImage(named: friend.imageName)
    }

}
