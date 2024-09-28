//
//  CustomPerformanceCell.swift
//  EduAppPro
//
//  Created by Andrey on 21/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomPerformanceCell: UIView {

    let save = UserDefaults.standard
    
    let partLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.5, y: 10.9, width: 74, height: 16))
        label.numberOfLines = 0
        return label
    }()
    
    let evaluationsView: UIView = {
        let view = UIView(frame: CGRect(x: 45.1, y: 36.8, width: 25.6, height: 25.6))
        return view
    }()
    
    let gradePointAverageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.2, y: 73.6, width: 100, height: 15))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        label.text = "Средний был"
        return label
    }()
    
    let gradePointAverage: UILabel = {
        let label = UILabel(frame: CGRect(x: 43.8, y: 88.8, width: 35, height: 24))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x27AE60)
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.6, y: 117.5, width: 100, height: 12))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        label.text = "Итог за часть"
        return label
    }()
    
    let total: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.7, y: 134.7, width: 230, height: 18))
        return label
    }()
    
    let line: UIImageView = {
        let line = UIImageView(frame: CGRect(x: 22.3, y: 0, width: 330.3, height: 1.5))
        line.image = UIImage(named: "Line")
        return line
    }()
    
    func configure(width model: CustomPerformanceCellModel) {
        partLabel.text = "Часть " + String(model.parts)
        if model.haveTotal {
            let totalEvaluation = CustomTotalEvaluation(frame: CGRect(x: 44.7, y: 132.9, width: 35.1, height: 35.1))
            totalEvaluation.evaluation = Int(model.total)!
            total.alpha = 0
            self.addSubview(totalEvaluation)
            self.line.frame = CGRect(x: self.line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: totalEvaluation.frame.minY + totalEvaluation.frame.height + 12, width: self.line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: self.line.frame.height)
            self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height + 20)
        } else {
            total.text = model.total
            self.line.frame = CGRect(x: self.line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: self.total.frame.minY + self.total.frame.height + 10, width: self.line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: self.line.frame.height)
        }
        
        gradePointAverage.text = String(model.gradePointAverage)
        evaluationsView.frame = CGRect(x: evaluationsView.frame.minX, y: evaluationsView.frame.minY, width: evaluationsView.frame.width, height: self.frame.height - evaluationsView.frame.minX)
        let evaluation = CustomEvaluation(frame: CGRect(x: 0, y: 0, width: 25.6, height: 25.6))
        evaluation.evaluation = model.evaluations[0]
        let evaluation2 = CustomEvaluation(frame: CGRect(x: 30.6, y: 0, width: 25.6, height: 25.6))
        evaluation2.evaluation = model.evaluations[1]
        let evaluation3 = CustomEvaluation(frame: CGRect(x: 61.2, y: 0, width: 25.6, height: 25.6))
        evaluation3.evaluation = model.evaluations[2]
        let evaluation4 = CustomEvaluation(frame: CGRect(x: 91.8, y: 0, width: 25.6, height: 25.6))
        evaluation4.evaluation = model.evaluations[3]
        evaluationsView.addSubview(evaluation)
        evaluationsView.addSubview(evaluation2)
        evaluationsView.addSubview(evaluation3)
        evaluationsView.addSubview(evaluation4)
        
    }
    
    
    override func draw(_ rect: CGRect) {
        gradePointAverageLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.double(forKey: "width")) / 27)
        gradePointAverage.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.double(forKey: "width")) / 17)
        totalLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.double(forKey: "width")) / 27)
        total.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.double(forKey: "width")) / 17)
        partLabel.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.double(forKey: "width")) / 20)
        self.addSubview(partLabel)
        self.addSubview(evaluationsView)
        self.addSubview(gradePointAverageLabel)
        self.addSubview(gradePointAverage)
        self.addSubview(totalLabel)
        self.addSubview(total)
        self.addSubview(line)
    }
    

}
