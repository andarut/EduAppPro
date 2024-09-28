//
//  CustomCoursesPageCellType2Model.swift
//  EduAppPro
//
//  Created by Andrey on 01/08/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomCoursesPageCellType2Model {
    var smallText: String
    var type: CustomCoursesPageCellType2Type
    var mainText: String
    
    init(smallText: String, type: CustomCoursesPageCellType2Type, mainText: String) {
        self.smallText = smallText
        self.type = type
        self.mainText = mainText
    }
}

enum CustomCoursesPageCellType2Type {
    case classwork, homework, another
}
