//
//  NewGroupCell.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/23/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import UIKit

class NewGroupCell: UITableViewCell {
    
    @IBOutlet weak var newGroupName: UILabel!
    @IBOutlet weak var newGroupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    func configureCell(for newGroup: NewGroup) {
        newGroupName.text = newGroup.name
        newGroupImage.image = UIImage(named: newGroup.imageName)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
