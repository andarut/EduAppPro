//
//  CustomClassesPageCell.swift
//  EduAppPro
//
//  Created by Andrey on 23/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomClassesPageCell: UIView {

    let save = UserDefaults.standard
    
    let themeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.7, y: 15.8, width: 33, height: 11))
        label.text = "Тема"
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let theme: UILabel = {
        let label = UILabel(frame: CGRect(x: 46.3, y: 34.1, width: 180, height: 14))
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.7, y: 62.7, width: 125, height: 14))
        label.text = "Набранные баллы"
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let score: UILabel = {
        let label = UILabel(frame: CGRect(x: 46.3, y: 81.3, width: 180, height: 17))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x27AE60)
        return label
    }()
    
    let evaluationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 47, y: 110.5, width: 180, height: 14))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        label.text = "Оценки"
        return label
    }()
    
    let evaluation: UILabel = {
        let label = UILabel(frame: CGRect(x: 47, y: 131.2, width: 180, height: 17))
        return label
    }()

    func configure(with model: CustomClassesPageCellModel) {
        
        theme.text = model.theme
        
        score.text = String(model.score) + "/" + String(model.allScore)
        
        if model.haveEvaluation {
            let evaluation = CustomEvaluation(frame: CGRect(x: 50, y: 128.4, width: 25.6, height: 25.6))
            evaluation.evaluation = model.evaluation
            self.addSubview(evaluation)
        } else {
            evaluation.text = "Нет оценок"
        }
    }
    
    override func draw(_ rect: CGRect) {
        theme.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 20)
        score.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.integer(forKey: "width")) / 20)
        evaluation.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 20)
        
        themeLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 27)
        scoreLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 27)
        evaluationLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 27)
        self.addSubview(themeLabel)
        self.addSubview(theme)
        self.addSubview(scoreLabel)
        self.addSubview(score)
        self.addSubview(evaluationLabel)
        self.addSubview(evaluation)
    }

}
