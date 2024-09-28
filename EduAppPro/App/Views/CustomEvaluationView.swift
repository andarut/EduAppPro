//
//  CustomEvaluation.swift
//  EduAppPro
//
//  Created by Andrey on 21/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomEvaluation: UIView {

    var evaluation = 0
    
    let save = UserDefaults.standard
    
    let background: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.textColor = .white
        return label
    }()
    
    override func draw(_ rect: CGRect) {
        background.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        label.frame = CGRect(x: self.frame.height / 3.9, y: 0, width: self.frame.width, height: self.frame.height)
        label.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.integer(forKey: "width")) / 17)
        label.text = String(evaluation)
        if evaluation == 2 {
            background.image = UIImage(named: "redEvaluation")
        } else if evaluation == 3 {
            background.image = UIImage(named: "orangeEvaluation")
        } else if evaluation == 4 {
            background.image = UIImage(named: "blueEvaluation")
        } else if evaluation == 5 {
            background.image = UIImage(named: "greenEvaluation")
        }
        self.addSubview(background)
        self.addSubview(label)
    }

}
