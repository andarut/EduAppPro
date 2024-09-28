//
//  CustomCoursesPageCellType2.swift
//  EduAppPro
//
//  Created by Andrey on 01/08/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomCoursesPageCellType2: UIView {

    let save = UserDefaults.standard
    
    let image: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 44.7, y: 9.3, width: 9.3, height: 9.3))
        return imageView
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 57.1, y: 6, width: 170, height: 15))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44, y: 18.5, width: 320, height: 100))
        label.numberOfLines = 4
        return label
    }()
    
    let line: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 22.3, y: 0, width: 330.3, height: 1.5))
        imageView.image = UIImage(named: "Line")
        return imageView
    }()
    
    func configure(with model: CustomCoursesPageCellType2Model) {
        if model.type == .classwork {
            image.image = UIImage(named: "GreenPoint")
        } else if model.type == .homework {
            image.image = UIImage(named: "BluePoint")
        } else {
            image.image = UIImage(named: "GreyPoint")
        }
        
        self.smallLabel.text = model.smallText
        var i2 = 0
        for i in model.mainText {
            if i == " " {
                i2 += 1
            }
        }
        
        if i2 == 6 {
            mainLabel.numberOfLines = 4
        } else if i2 == 2 || i2 == 1 {
            mainLabel.numberOfLines = 2
        }
        mainLabel.frame = CGRect(x: mainLabel.frame.minX, y: mainLabel.frame.minY, width: mainLabel.frame.width, height: CGFloat(mainLabel.numberOfLines) * 25)
        self.mainLabel.text = model.mainText
        self.line.frame = CGRect(x: self.line.frame.minX, y: mainLabel.frame.minY + mainLabel.frame.height, width: self.line.frame.width, height: self.line.frame.height)
    }
    
    override func draw(_ rect: CGRect) {
        self.smallLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 27)
        self.mainLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width")) / 20)
        self.addSubview(image)
        self.addSubview(smallLabel)
        self.addSubview(mainLabel)
        self.addSubview(line)
    }

}
