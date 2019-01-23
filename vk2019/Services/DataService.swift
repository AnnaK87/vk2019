//
//  DataService.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/22/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    private var groups = [Group(name: "Some group for something doimg together", imageName: "picAndrey"),
                          Group(name: "Will attempt to recover by breaking", imageName: "picJack")]
    
    private var newGroups = [NewGroup(name: "Help yourself start working", imageName: "newGroup1"),
                             NewGroup(name: "You want to learn skills", imageName: "newGroup2"),
                             NewGroup(name: "Bla-bla-bla", imageName: "newGroup3")]
    
    private var friends = [Friend(name: "Andriy", imageName: "picAndrey"),
                           Friend(name: "Jack", imageName: "picJack"),
                           Friend(name: "Rockefeler", imageName: "picRockefeler")]
    
    private var Andriy = [FriendImage(imageName: "andrey1"), FriendImage(imageName: "andrey2"),
                          FriendImage(imageName: "andrey3")]
    
    private var Jack = [FriendImage(imageName: "jack1"), FriendImage(imageName: "jack2"),
                        FriendImage(imageName: "jack3")]
    
    private var Rockefeler = [FriendImage(imageName: "rockefeler1"), FriendImage(imageName: "rockefeler2")]
    
    
    // MARK: Getting data
    func getGroups() -> [Group] {
        return groups
    }
    
    func getFriends() -> [Friend] {
        return friends
    }
    
    func getNewGroup() -> [NewGroup] {
        return newGroups
    }
    
    func getImages(for friend: Friend) -> [FriendImage] {
        switch friend.name {
        case "Andriy":
            return Andriy
        case "Jack":
            return Jack
        case "Rockefeler":
            return Rockefeler
        default:
            return Andriy
        }
    }
    
    // MARK: Append Data
    func appendGroup(with newGroup: NewGroup) {
        groups.append(Group(name: newGroup.name, imageName: newGroup.imageName))
    }
    
    // MARK: Remove Data
    func removeGroup(_ indexPath: IndexPath) -> [Group] {
        groups.remove(at: indexPath.row)
        return groups
    }
    
    func removeFriend(_ indexPath: IndexPath) -> [Friend] {
        friends.remove(at: indexPath.row)
        return friends
    }
    
    
}
