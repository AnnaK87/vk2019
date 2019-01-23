//
//  FriendsList.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/16/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import Foundation

struct Friend {
    private var _name: String
    private var _imageName: String
    
    var name: String {
        return _name
    }
    
    var imageName: String {
        return _imageName
    }
    
    init(name: String, imageName: String) {
        self._name = name
        self._imageName = imageName
    }
    
}
