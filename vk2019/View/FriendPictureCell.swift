//
//  FriendPictureCell.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/17/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import UIKit

class FriendPictureCell: UICollectionViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!
    
    
    func configureCell(for image: FriendImage) {
      friendImage.image = UIImage(named: image.imageName)
    }
    
}
