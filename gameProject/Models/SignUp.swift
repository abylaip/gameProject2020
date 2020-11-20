//
//  File.swift
//  gameProject
//
//  Created by Abyl on 11/20/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import Foundation

struct Authorize: Encodable, Decodable {
    let fullName: String
    let phone: String
    let password: String
}
