//
//  User.swift
//  SwiftOverlay_Example
//
//  Created by Samvel on 6/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class User {
    var username: String!
    var avatar: URL?
    
    init(with dict: [String: Any]) {
        username = dict["login"] as? String
        avatar = URL(string: (dict["avatar_url"] as? String) ?? "")
    }
}
