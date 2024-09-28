//
//  CustomPeopleCell.swift
//  EduAppPro
//
//  Created by Andrey on 24/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomPeopleCell: UIView {

    let save = UserDefaults.standard
    
    let mainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 131.5, y: 25, width: 180, height: 20))
        return label
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 131.5, y: 45, width: 180, height: 50))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        label.numberOfLines = 0
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 44.7, y: 10, width: 70, height: 70))
        return imageView
    }()
    
    func configure(with model: CustomPeopleCellModel) {
        mainLabel.text = model.mainText
        smallLabel.text = model.smallText
        image.image = UIImage(named: model.image)
    }
    
    override func draw(_ rect: CGRect) {
        mainLabel.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.integer(forKey: "width") / 20))
        smallLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 20))
        self.addSubview(mainLabel)
        self.addSubview(smallLabel)
        self.addSubview(image)
    }

}
