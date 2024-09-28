//
//  CustomCoursesCellModel.swift
//  EduAppPro
//
//  Created by Andrey on 21/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomCoursesCellModel {
    var mainText: String
    var smallText: String
    var image: String
    
    init(mainText: String, smallText: String, image: String) {
        self.mainText = mainText
        self.smallText = smallText
        self.image = image
    }
}
