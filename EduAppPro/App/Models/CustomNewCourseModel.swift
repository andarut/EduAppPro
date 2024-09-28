//
//  CustomNewCourseModel.swift
//  EduAppPro
//
//  Created by Andrey on 30/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomNewCourseModel {
    var image: String
    var mainText: String
    var teacherText: String
    var description: String
    var apply: Bool
    
    init(image: String, mainText: String, teacherText: String, description: String, apply: Bool) {
        self.image = image
        self.mainText = mainText
        self.teacherText = teacherText
        self.description = description
        self.apply = apply
    }
}
