//
//  CustomTeacherCell.swift
//  EduAppPro
//
//  Created by Andrey on 23/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomTeacherCell: UIView {

    let save = UserDefaults.standard
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 110.6, y: 15.5, width: 211, height: 13))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        label.text = "Основной преподаватель:"
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 44.7, y: 15.4, width: 54.9, height: 54.9))
        return imageView
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 111.8, y: 24, width: 156.6, height: 60))
        label.numberOfLines = 0
        return label
    }()
    
    func configure(with model: CustomTeacherCellModel) {
        image.image = UIImage(named: model.image)
        mainLabel.text = model.mainText
    }
    
    override func draw(_ rect: CGRect) {
        smallLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 27))
        mainLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 20))
        self.addSubview(smallLabel)
        self.addSubview(image)
        self.addSubview(mainLabel)
    }

}
