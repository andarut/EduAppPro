//
//  CustomCoursesPageCellModel.swift
//  EduAppPro
//
//  Created by Andrey on 01/08/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomCoursesPageCellType1Model {
    var evaluations: Int
    var gradePointAverage: Float
    var haveTotal: Bool
    var total: Int
    var classes: Int
    var allClasses: Int
    
    init(evaluations: Int, gradePointAverage: Float, haveTotal: Bool, total: Int, classes: Int, allClasses: Int) {
        self.evaluations = evaluations
        self.gradePointAverage = gradePointAverage
        self.total = total
        self.haveTotal = haveTotal
        self.classes = classes
        self.allClasses = allClasses
    }
}

