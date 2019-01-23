//
//  NewGroup.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/23/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import Foundation

struct NewGroup {
    private(set) public var name: String
    private(set) public var imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
}


