//
//  CustomProgressCellModel.swift
//  EduAppPro
//
//  Created by Andrey on 22/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class CustomProgressCellModel {
    var image: String
    var smallText: String
    var mainText: String
    var mediumText: String
    var open: Bool
    var percents: Int
    
    init(image: String, smallText: String, mainText: String, mediumText: String, open: Bool, percents: Int) {
        self.image = image
        self.smallText = smallText
        self.mainText = mainText
        self.mediumText = mediumText
        self.open = open
        self.percents = percents
    }
}
