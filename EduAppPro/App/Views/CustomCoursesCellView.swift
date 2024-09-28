//
//  CustomCoursesCell.swift
//  EduAppPro
//
//  Created by Andrey on 21/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomCoursesCell: UIView {

    let save = UserDefaults.standard
    
    var input = UIViewController()
    
    let mainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 137.5, y: 24.7, width: 200, height: 55))
        label.numberOfLines = 0
        return label
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 138, y: 66.8, width: 220, height: 50))
        label.numberOfLines = 0
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 37.7, y: 14.7, width: 87.7, height: 87.7))
        return image
    }()
    
    let line: UIImageView = {
        let line = UIImageView(frame: CGRect(x: 22.3, y: 0, width: 330.3, height: 1.5))
        line.image = UIImage(named: "Line")
        return line
    }()
    
    var teacher = ""
    
    func configure(with model: CustomCoursesCellModel) {
        self.mainLabel.text = model.mainText
        teacher = model.smallText
        let forSmallLabel = UILabel()
        forSmallLabel.text = "Основной преподаватель: "
        self.smallLabel.text = """
                                \(forSmallLabel.text!)
                                \(model.smallText)
                                """
        let range = (self.smallLabel.text! as NSString).range(of: forSmallLabel.text!)
        let attributedString = NSMutableAttributedString(string: self.smallLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.UIColorFromRGB(rgbValue: 0x6B6B6B), range: range)
        smallLabel.attributedText = attributedString
        self.image.image = UIImage(named: model.image)
        self.line.frame = CGRect(x: self.line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: self.image.frame.minY + self.image.frame.height + 10, width: self.line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: self.line.frame.height)
        self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height)
    }
    
    override func draw(_ rect: CGRect) {
        mainLabel.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.double(forKey: "width") / 20))
        self.addSubview(mainLabel)
        smallLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.double(forKey: "width") / 27))
        self.addSubview(smallLabel)
        self.addSubview(image)
        self.addSubview(line)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let coursesPageController = CoursesPageController()
        coursesPageController.modalTransitionStyle = .crossDissolve
        coursesPageController.name = mainLabel.text!
        coursesPageController.teacher = teacher
        self.input.present(coursesPageController, animated: true, completion: nil)
    }
    
    

}
