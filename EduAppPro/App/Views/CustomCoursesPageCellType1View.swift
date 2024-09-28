//
//  CustomCoursesPageCell.swift
//  EduAppPro
//
//  Created by Andrey on 01/08/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomCoursesPageCellType1: UIView {

    let save = UserDefaults.standard
    
    let evaluationsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 15.5, width: 63.2, height: 14))
        label.text = "Оценок"
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let evaluations: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.3, y: 34.1, width: 35, height: 16))
        return label
    }()
    
    let gradePointAverageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.2, y: 63, width: 100, height: 14))
        label.text = "Средний балл"
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let gradePointAverage: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.3, y: 81.7, width: 35, height: 14))
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 110.4, width: 120, height: 14))
        label.text = "Оценка за часть"
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let total: UILabel = {
        let label = UILabel(frame: CGRect(x: 46, y: 129.1, width: 200, height: 16))
        return label
    }()
    
    let classesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 46.4, y: 157.6, width: 125, height: 14))
        label.text = "Посещено занятий"
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let classes: UILabel = {
        let label = UILabel(frame: CGRect(x: 47, y: 176.1, width: 100, height: 16))
        return label
    }()
    
    func configure(with model: CustomCoursesPageCellType1Model) {
        evaluations.text = String(model.evaluations)
        gradePointAverage.text = String(model.gradePointAverage)
        gradePointAverage.textColor = UIColor.UIColorFromRGB(rgbValue: 0x27AE60)
        classes.text = String(model.classes) + " из " + String(model.allClasses)
        if model.haveTotal {
            if Int(model.total) == 5 {
                let evaluation = CustomEvaluation(frame: CGRect(x: 0, y: 0, width: 35.1, height: 35.1))
                evaluation.evaluation = model.total
            }
        } else {
            total.text = "Часть не закончена"
        }
    }
    
    override func draw(_ rect: CGRect) {
        evaluations.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 20)
        gradePointAverage.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.integer(forKey: "width")) / 20)
        total.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 20)
        classes.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 20)
        
        evaluationsLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 27)
        gradePointAverageLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 27)
        totalLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 27)
        classesLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 27)
        
        self.addSubview(evaluations)
        self.addSubview(evaluationsLabel)
        self.addSubview(gradePointAverage)
        self.addSubview(gradePointAverageLabel)
        self.addSubview(total)
        self.addSubview(totalLabel)
        self.addSubview(classes)
        self.addSubview(classesLabel)
    }
}
