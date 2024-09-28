//
//  CustomMenuCell.swift
//  EduAppPro
//
//  Created by Andrey on 17/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomMenuCell: UIView {
    
    let save = UserDefaults.standard
    
    var input = UIViewController()
    
    let icon: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 44.7, y: 22.5, width: 25.6, height: 20.7))
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 85.9, y: 23, width: 110, height: 20))
        label.textColor = .white
        return label
    }()
    
    func configure(with model: CustomMenuCellModel) {
        icon.frame = CGRect(x: icon.frame.minX, y: icon.frame.minY * CGFloat(save.double(forKey: "scaleX")), width: icon.frame.width, height: icon.frame.height)
        label.frame = CGRect(x: label.frame.minX, y: label.frame.minY * CGFloat(save.double(forKey: "scaleX")), width: label.frame.width, height: label.frame.height)
        self.icon.image = UIImage(named: model.iconImage)
        self.label.text = model.name
        if model.name == "Главная" {
            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY, width: 80, height: label.frame.height)
        } else if model.name == "Обсуждения" {
            icon.frame = CGRect(x: icon.frame.minX, y: icon.frame.minY, width: icon.frame.width - 3, height: icon.frame.height)
            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY, width: 130, height: label.frame.height)
        } else if model.name == "Занятия" {
            icon.frame = CGRect(x: icon.frame.minX, y: icon.frame.minY, width: icon.frame.width - 3, height: icon.frame.height)
            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY, width: 100, height: label.frame.height)
        } else if model.name == "Курсы" {
            icon.frame = CGRect(x: icon.frame.minX, y: icon.frame.minY + 2, width: icon.frame.width - 2, height: icon.frame.height - 3)
            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY, width: 70, height: label.frame.height)
        } else if model.name == "Оценки" {
            icon.frame = CGRect(x: icon.frame.minX + 2, y: icon.frame.minY + 2, width: icon.frame.width - 10, height: icon.frame.height - 4)
            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY, width: 80, height: label.frame.height)
        } else if model.name == "Финансы" {
            icon.frame = CGRect(x: icon.frame.minX + 2, y: icon.frame.minY - 2, width: icon.frame.width - 8, height: icon.frame.height + 4)
            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY, width: 100, height: label.frame.height)
        } else if model.name == "Достижения" {
            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY, width: 160, height: label.frame.height)
        } else if model.name == "Авторы приложения" {
            icon.frame = CGRect(x: icon.frame.minX, y: icon.frame.minY, width: icon.frame.width - 3, height: icon.frame.height)
            label.frame = CGRect(x: label.frame.minX, y: label.frame.minY, width: 200, height: label.frame.height)
        }
        
    }

    override func draw(_ rect: CGRect) {
        self.addSubview(icon)
        label.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.double(forKey: "width")) / 20)
        self.addSubview(label)
    }
    
    func setSelected(selected: Bool) {
        if selected {
            self.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0x363F50)
        } else {
            self.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0x3D495F)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.label.text == "Главная" {
            let mainController = MainController()
            mainController.modalTransitionStyle = .crossDissolve
            self.input.present(mainController, animated: true, completion: nil)
        } else if self.label.text == "Обсуждения" {
            let discussionController = DiscussionController()
            discussionController.modalTransitionStyle = .crossDissolve
            self.input.present(discussionController, animated: true, completion: nil)
        } else if self.label.text == "Занятия" {
            let classesController = ClassesController()
            classesController.modalTransitionStyle = .crossDissolve
            self.input.present(classesController, animated: true, completion: nil)
        } else if self.label.text == "Курсы" {
            let coursesController = CoursesController()
            coursesController.modalTransitionStyle = .crossDissolve
            self.input.present(coursesController, animated: true, completion: nil)
        } else if self.label.text == "Оценки" {
            let performanceController = PerformanceController()
            performanceController.modalTransitionStyle = .crossDissolve
            self.input.present(performanceController, animated: true, completion: nil)
        } else if self.label.text == "Финансы" {
            let financeController = FinanceController()
            financeController.modalTransitionStyle = .crossDissolve
            self.input.present(financeController, animated: true, completion: nil)
        } else if self.label.text == "Достижения" {
            let progressController = ProgressController()
            progressController.modalTransitionStyle = .crossDissolve
            self.input.present(progressController, animated: true, completion: nil)
        } else if self.label.text == "Авторы приложения" as String {
            let authorsOfAppController = AuthorsOfAppController()
            authorsOfAppController.modalTransitionStyle = .crossDissolve
            self.input.present(authorsOfAppController, animated: true, completion: nil)
        }
    }


}


