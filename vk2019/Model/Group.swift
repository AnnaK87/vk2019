//
//  Group.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/19/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import Foundation

struct Group {
    private(set) public var name: String
    private(set) public var imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}
