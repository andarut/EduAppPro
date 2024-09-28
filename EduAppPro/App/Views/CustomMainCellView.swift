//
//  CustomCell.swift
//  EduAppPro
//
//  Created by Andrey on 09/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomMainCell: UIView {
     
    var classworkLabel = UILabel()
    var homeworkLabel = UILabel()
    var evaluationImageView = UIImageView()
    var point1 = UIImageView()
    var point2 = UIImageView()
    var input = UIViewController()
    
    var classesPageController = ClassesPageController()
    
    let save = UserDefaults.standard
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.3, y: 8.4, width: 182.4, height: 13.5))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.5, y: 28.4, width: 343.4, height: 17))
        return label
    }()
    
    let line: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 22.3, y: 53, width: 330.3, height: 1.5))
        imageView.image = UIImage(named: "Line")
        return imageView
    }()
    
    func configure(with model: CustomCellModel) {
        self.smallLabel.text = model.smallText
        self.mainLabel.text = model.mainText
        classesPageController.name = model.mainText
        classesPageController.date = model.smallText
        if model.haveClasswork {
            if model.haveHomework {
                point1 = {
                    let imageView = UIImageView(frame: CGRect(x: 44.7, y: mainLabel.frame.minY + 25.8, width: 9.5, height: 9.5))
                    imageView.image = UIImage(named: "BluePoint")
                    return imageView
                }()
                
                point2 = {
                    let imageView = UIImageView(frame: CGRect(x: 44.7, y: mainLabel.frame.minY + 48.1, width: 9.5, height: 9.5))
                    imageView.image = UIImage(named: "GreenPoint")
                    return imageView
                }()
                
                homeworkLabel = {
                    let label = UILabel(frame: CGRect(x: 63.7, y: mainLabel.frame.minY + 21.4, width: 250.6, height: 17.9))
                    label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x0087C7)
                    label.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 20))
                    label.text = "Домашняя работа 10/100"
                    return label
                }()
                classworkLabel = {
                    let label = UILabel(frame: CGRect(x: 63.7, y: mainLabel.frame.minY + 44.4, width: 222.6, height: 17.9))
                    label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x27AE60)
                    label.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 20))
                    label.text = "Проект 0/100"
                    return label
                }()
                line.frame = CGRect(x: line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: mainLabel.frame.minY + 70.5, width: line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: line.frame.height)
            } else {
                classworkLabel = {
                    let label = UILabel(frame: CGRect(x: 63.7, y: mainLabel.frame.minY + 21.3, width: 222.6, height: 17.9))
                    label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x27AE60)
                    label.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 20))
                    label.text = "Проект 0/100"
                    return label
                }()
                
                point2 = {
                    let imageView = UIImageView(frame: CGRect(x: 50, y: mainLabel.frame.minY + 25.7, width: 9.5, height: 9.5))
                    imageView.image = UIImage(named: "BluePoint")
                    return imageView
                }()
                
                line.frame = CGRect(x: line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: mainLabel.frame.minY + 47.4, width: line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: line.frame.height)
            }
            
        } else if model.haveHomework {
            homeworkLabel = {
                let label = UILabel(frame: CGRect(x: 63.7, y: mainLabel.frame.minY + 21.3, width: 250.6, height: 17.9))
                label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x0087C7)
                label.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 20))
                label.text = "Домашняя работа 10/100"
                return label
            }()
            
            point1 = {
                let imageView = UIImageView(frame: CGRect(x: 44.7, y: mainLabel.frame.minY + 25.7, width: 9.5, height: 9.5))
                imageView.image = UIImage(named: "BluePoint")
                return imageView
            }()
            
            line.frame = CGRect(x: line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: mainLabel.frame.minY + 47.4, width: line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: line.frame.height)
        } else if model.haveEvaluation {
            evaluationImageView = {
                let imageView = UIImageView(frame: CGRect(x: 41.4, y: smallLabel.frame.minY + 18.2, width: 35.6, height: 35.6))
                imageView.image = UIImage(named: "GreenEllips")
                let label = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 14))
                label.text = "5-"
                label.textColor = .white
                imageView.addSubview(label)
                return imageView
            }()
            line.frame = CGRect(x: line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: smallLabel.frame.minY + 61.7, width: line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: line.frame.height)
            mainLabel.frame = CGRect(x: 85, y: Int(smallLabel.frame.minY + 28.5), width: Int(mainLabel.frame.width), height: Int(mainLabel.frame.height))
        } else {
            if model.textClip == true {
                mainLabel.numberOfLines = 0
                mainLabel.frame = CGRect(x: 44.5, y: self.mainLabel.frame.minY - 12, width: 343.4, height: 56)
                line.frame = CGRect(x: self.line.frame.minX, y: self.line.frame.minY + 15, width: self.line.frame.width, height: self.line.frame.height)
            }
            if model.selectedText != "" {
                let range = (self.mainLabel.text! as NSString).range(of: model.selectedText)
                let attributedString = NSMutableAttributedString(string: self.mainLabel.text!)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.UIColorFromRGB(rgbValue: 0x0087C7), range: range)
                mainLabel.attributedText = attributedString
            }
            line.frame = CGRect(x: line.frame.minX*CGFloat(save.double(forKey: "scaleX")), y: line.frame.minY, width: line.frame.width*CGFloat(save.double(forKey: "scaleX")), height: line.frame.height)
            
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        smallLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 27))
        mainLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 20))
        self.addSubview(smallLabel)
        self.addSubview(mainLabel)
        self.addSubview(line)
        self.addSubview(homeworkLabel)
        self.addSubview(classworkLabel)
        self.addSubview(evaluationImageView)
        self.addSubview(point1)
        self.addSubview(point2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        classesPageController.modalTransitionStyle = .crossDissolve
        classesPageController.input = "Главная"
        input.present(classesPageController, animated: true, completion: nil)
        
        
    }
    

}


