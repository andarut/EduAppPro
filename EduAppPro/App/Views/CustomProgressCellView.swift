//
//  CustomProgressCell.swift
//  EduAppPro
//
//  Created by Andrey on 22/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomProgressCell: UIView {

    let save = UserDefaults.standard
    
    let image: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 44.7, y: 14.4, width: 85.3, height: 85.3))
        return imageView
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 135, y: 30.3, width: 160, height: 14))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let mainLabel: UILabel = {
        let mainLabel = UILabel(frame: CGRect(x: 135, y: 51.4, width: 200, height: 15))
        return mainLabel
    }()
    
    let mediumLabel: UILabel = {
        let mediumLabel = UILabel(frame: CGRect(x: 135, y: 71.9, width: 170, height: 36))
        mediumLabel.numberOfLines = 0
        return mediumLabel
    }()
    
    let line: UIImageView = {
        let line = UIImageView(frame: CGRect(x: 22.3, y: 0, width: 330.3, height: 1.5))
        line.image = UIImage(named: "Line")
        return line
    }()
    
    func configure(with model: CustomProgressCellModel) {
        smallLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 29))
        mediumLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 29))
        mainLabel.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.integer(forKey: "width") / 20))
        image.image = UIImage(named: model.image)
        mediumLabel.text = model.mediumText
        if model.open {
            smallLabel.text = model.smallText
            mainLabel.text = model.mainText
        } else {
            mainLabel.text = "Секретная награда"
            smallLabel.text = "Пройдено " + String(model.percents) + "%"
        }
        line.frame = CGRect(x: line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: mediumLabel.frame.minY + mediumLabel.frame.height + 10, width: line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: line.frame.height)
    }
    
    override func draw(_ rect: CGRect) {
        self.addSubview(image)
        self.addSubview(smallLabel)
        self.addSubview(mainLabel)
        self.addSubview(mediumLabel)
        self.addSubview(line)
    }

}
