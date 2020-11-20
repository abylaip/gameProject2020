//
//  SingletonClass.swift
//  gameProject
//
//  Created by Abyl on 11/20/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

struct userJSON: Decodable {
    let data: [userData]
}

struct userData: Decodable {
    let phone: String
    let genres: [String]
    let profile: Profile
}

struct Profile: Decodable {
    let fullName: String
}


class SingletonClass {
    static let shared = SingletonClass()
    
    var sharedUser = userObject()
    var locationGranted: Bool?
    
    func requestForUser() -> userObject {
        return self.sharedUser
    }
}

class userObject {
    var phone = ""
    var fullName = ""
}
