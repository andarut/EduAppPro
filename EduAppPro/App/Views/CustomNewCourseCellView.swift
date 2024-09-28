//
//  CustomNewCourseCell.swift
//  EduAppPro
//
//  Created by Andrey on 30/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomNewCourseCell: UIView {

    var applyBool = false
    
    let save = UserDefaults.standard
    
    let image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 37.3, y: 14.7, width: 87.7, height: 87.7))
        return image
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 137.5, y: 10.7, width: 130, height: 70))
        label.numberOfLines = 0
        return label
    }()
    
    let teacherLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 138, y: 66.8, width: 180.5, height: 40))
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 137.7, y: 96.8, width: 165, height: 60))
        label.numberOfLines = 0
        return label
    }()
    
    let applyButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 137.7, y: 150.4, width: 150.4, height: 20))
        button.addTarget(self, action: #selector(apply), for: .touchDown)
        return button
    }()
    
    let line: UIImageView = {
        let line = UIImageView(image: UIImage(named: "Line"))
        return line
    }()
    
    func configure(with model: CustomNewCourseModel) {
        image.image = UIImage(named: model.image)
        mainLabel.text = model.mainText
 
        let forTeacherLabel = UILabel()
        forTeacherLabel.text = "Основной преподаватель: "
        forTeacherLabel.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        teacherLabel.text = """
                             \(forTeacherLabel.text!)
                             \(model.teacherText)
                             """
        let range = (self.teacherLabel.text! as NSString).range(of: forTeacherLabel.text!)
        let attributedString = NSMutableAttributedString(string: self.teacherLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.UIColorFromRGB(rgbValue: 0x6B6B6B), range: range)
        teacherLabel.attributedText = attributedString
        
        let forDescriptionLabel = UILabel()
        forDescriptionLabel.text = "Описание"
        forDescriptionLabel.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        descriptionLabel.text = """
                                 \(forDescriptionLabel.text!)
                                 \(model.description)
                                 """
        let range2 = (self.descriptionLabel.text! as NSString).range(of: forDescriptionLabel.text!)
        let attributedString2 = NSMutableAttributedString(string: self.descriptionLabel.text!)
        attributedString2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.UIColorFromRGB(rgbValue: 0x6B6B6B), range: range2)
        descriptionLabel.attributedText = attributedString2
        
        applyBool = model.apply
        
        if applyBool == true {
            applyButton.setTitle("Отменить заявку", for: .normal)
            applyButton.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0xDA4C36), for: .normal)
            applyButton.frame = CGRect(x: 134.7, y: applyButton.frame.minY, width: applyButton.frame.width, height: applyButton.frame.height)
        } else {
            applyButton.setTitle("Подать заявку", for: .normal)
            applyButton.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1697D4), for: .normal)
            applyButton.frame = CGRect(x: 124.7, y: applyButton.frame.minY, width: applyButton.frame.width, height: applyButton.frame.height)
        }
        
        line.frame = CGRect(x: 22.3, y: applyButton.frame.minY + applyButton.frame.height + 13.9, width: 330.3, height: 1.5)
    }
    
    override func draw(_ rect: CGRect) {
        mainLabel.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.integer(forKey: "width") / 20))
        teacherLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 27))
        descriptionLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 27))
        applyButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.integer(forKey: "width") / 20))
        self.addSubview(image)
        self.addSubview(mainLabel)
        self.addSubview(teacherLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(applyButton)
        self.addSubview(line)
    }
    
    @objc func apply() {
        if applyBool == false {
            applyButton.setTitle("Отменить заявку", for: .normal)
            applyButton.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0xDA4C36), for: .normal)
            applyButton.frame = CGRect(x: 134.7, y: applyButton.frame.minY, width: applyButton.frame.width, height: applyButton.frame.height)
            applyBool = true
        } else {
            applyButton.setTitle("Подать заявку", for: .normal)
            applyButton.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1697D4), for: .normal)
            applyButton.frame = CGRect(x: 124.7, y: applyButton.frame.minY, width: applyButton.frame.width, height: applyButton.frame.height)
            applyBool = false
        }
    }

}
