//
//  User.swift
//  EduAppPro
//
//  Created by Andrey on 25/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import MessengerKit

struct User: MSGUser {
    
    var displayName: String
    
    var avatar: UIImage?
    
    var avatarUrl: URL?
    
    var isSender: Bool
    
}
