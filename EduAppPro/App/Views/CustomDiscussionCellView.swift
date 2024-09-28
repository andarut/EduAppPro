//
//  CustomDiscussionCell.swift
//  EduAppPro
//
//  Created by Andrey on 20/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomDiscussionCell: UIView {

    let save = UserDefaults.standard

    var input = UIViewController()
    
    let mainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 101.3, y: 16.7, width: 200, height: 17))
        return label
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 101.3, y: 37.1, width: 200, height: 12))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 44.7, y: 9.5, width: 46, height: 46))
        return image
    }()
    
    let line: UIImageView = {
        let line = UIImageView(frame: CGRect(x: 0, y: 0, width: 330.3, height: 1.5))
        line.image = UIImage(named: "Line")
        return line
    }()
    
    func configure(with model: CustomDiscussionCellModel) {
        self.mainLabel.text = model.mainText
        self.smallLabel.text = model.smallText
        self.image.image = UIImage(named: model.image)
        self.line.frame = CGRect(x: self.line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: self.smallLabel.frame.minY + self.smallLabel.frame.height + 10, width: self.line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: self.line.frame.height)
    }
    
    override func draw(_ rect: CGRect) {
        mainLabel.font = UIFont(name: "Roboto-Medium", size: CGFloat(save.double(forKey: "width") / 20))
        self.addSubview(mainLabel)
        smallLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.double(forKey: "width") / 27))
        self.addSubview(smallLabel)
        self.addSubview(image)
        line.frame = CGRect(x: 22.3, y: image.frame.minY + 54, width: line.frame.width, height: line.frame.height)
        self.addSubview(line)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let chatController = ChatController()
        chatController.modalTransitionStyle = .crossDissolve
        chatController.name = mainLabel.text!
        self.input.present(chatController, animated: true, completion: nil)
    }

}
