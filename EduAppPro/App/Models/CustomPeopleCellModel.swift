//
//  CustomPeopleCellModel.swift
//  EduAppPro
//
//  Created by Andrey on 24/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomPeopleCellModel {
    var mainText: String
    var smallText: String
    var image: String
    
    init(mainText: String, smallText: String, image: String) {
        self.mainText = mainText
        self.smallText = smallText
        self.image = image
    }
}
