//
//  CustomClassesPageCellModel.swift
//  EduAppPro
//
//  Created by Andrey on 23/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomClassesPageCellModel {
    var theme: String
    var score: Int
    var allScore: Int
    var haveEvaluation: Bool
    var evaluation: Int
    
    init(theme: String, score: Int, allScore: Int, haveEvaluation: Bool, evaluation: Int) {
        self.theme = theme
        self.score = score
        self.allScore = allScore
        self.haveEvaluation = haveEvaluation
        self.evaluation = evaluation
    }
}
