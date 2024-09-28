//
//  CustomPerformanceCellModel.swift
//  EduAppPro
//
//  Created by Andrey on 21/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomPerformanceCellModel {
    var parts: Int
    var gradePointAverage: Float
    var total: String
    var haveEvaluationInTotal: Bool
    var haveGradePointAverage: Bool
    var haveTotal: Bool
    var haveEvaluations: Bool
    var evaluations: [Int]
    
    init(parts: Int, gradePointAverage: Float, total: String, haveEvaluationInTotal: Bool, haveGradePointAverage: Bool, haveTotal: Bool, haveEvaluations: Bool, evaluations: [Int]) {
        self.parts = parts
        self.gradePointAverage = gradePointAverage
        self.total = total
        self.haveEvaluationInTotal = haveEvaluationInTotal
        self.haveGradePointAverage = haveGradePointAverage
        self.haveTotal = haveTotal
        self.haveEvaluations = haveEvaluations
        self.evaluations = evaluations
    }
    
}
