//
//  DataTypes.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 9/30/23.
//

import Foundation

struct User {
    var name: String
    var profileImage: String
}

struct Plan {
    var name: String
    var date: Date
    var description: String
    var isCanceled: Bool = false
    var friends: [User] = []
}
