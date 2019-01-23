//
//  GroupCell.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/19/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configureCell(for group: Group) {
        groupName.text = group.name
        groupImage.image = UIImage(named: group.imageName)
    }

    
}
