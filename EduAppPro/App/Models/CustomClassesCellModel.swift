//
//  CustomClassesPageCellModel.swift
//  EduAppPro
//
//  Created by Andrey on 23/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomClassesCellModel {
    var smallText: String
    var mainText: String
    var haveEvaluation: Bool
    var haveClasswork: Bool
    var haveHomework: Bool
    var textClip: Bool
    var selectedText: String
    
    init(smallText: String, mainText: String, haveEvaluation: Bool, haveClasswork: Bool, haveHomework: Bool, textClip: Bool, selectedText: String) {
        self.smallText = smallText
        self.mainText = mainText
        self.haveEvaluation = haveEvaluation
        self.haveClasswork = haveClasswork
        self.haveHomework = haveHomework
        self.textClip = textClip
        self.selectedText = selectedText
    }
}
