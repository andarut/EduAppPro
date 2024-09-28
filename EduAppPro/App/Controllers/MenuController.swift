//
//  MenuController.swift
//  EduAppPro
//
//  Created by Andrey on 17/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    var input = ""
    
    let save = UserDefaults.standard
    
    let logo: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 237.4, y: 44.7, width: 95.6, height: 46))
        imageView.image = UIImage(named: "BlackLogo")
        return imageView
    }()
    
    let menuButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 44.7, y: 44.7, width: 60, height: 46))
        button.setBackgroundImage(UIImage(named: "MenuButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchDown)
        return button
    }()
    
    let mainControllerCell: CustomMenuCell = {
        let cell = CustomMenuCell(frame: CGRect(x: 0, y: 105.5, width: 375, height: 65.7))
        cell.setSelected(selected: false)
        let model = CustomMenuCellModel(iconImage: "mainMenuImage", name: "Главная")
        cell.configure(with: model)
        return cell
    }()
    
    let discussionControllerCell: CustomMenuCell = {
        let cell = CustomMenuCell(frame: CGRect(x: 0, y: 171.1, width: 375, height: 65.7))
        cell.setSelected(selected: false)
        let model = CustomMenuCellModel(iconImage: "discussionMenuImage", name: "Обсуждения")
        cell.configure(with: model)
        return cell
    }()
    
    let classesControllerCell: CustomMenuCell = {
        let cell = CustomMenuCell(frame: CGRect(x: 0, y: 236.8, width: 375, height: 65.7))
        cell.setSelected(selected: false)
        let model = CustomMenuCellModel(iconImage: "classesMenuImage", name: "Занятия")
        cell.configure(with: model)
        return cell
    }()
    
    let coursesControllerCell: CustomMenuCell = {
        let cell = CustomMenuCell(frame: CGRect(x: 0, y: 302.5, width: 375, height: 65.7))
        cell.setSelected(selected: false)
        let model = CustomMenuCellModel(iconImage: "coursesMenuImage", name: "Курсы")
        cell.configure(with: model)
        return cell
    }()
    
    let performanceControllerCell: CustomMenuCell = {
        let cell = CustomMenuCell(frame: CGRect(x: 0, y: 368.1, width: 375, height: 65.7))
        cell.setSelected(selected: false)
        let model = CustomMenuCellModel(iconImage: "performanceMenuImage", name: "Оценки")
        cell.configure(with: model)
        return cell
    }()
    
    let financeControllerCell: CustomMenuCell = {
        let cell = CustomMenuCell(frame: CGRect(x: 0, y: 433.8, width: 375, height: 65.7))
        cell.setSelected(selected: false)
        let model = CustomMenuCellModel(iconImage: "financeMenuImage", name: "Финансы")
        cell.configure(with: model)
        return cell
    }()
    
    let progressControllerCell: CustomMenuCell = {
        let cell = CustomMenuCell(frame: CGRect(x: 0, y: 499.5, width: 375, height: 65.7))
        cell.setSelected(selected: false)
        let model = CustomMenuCellModel(iconImage: "progressMenuImage", name: "Достижения")
        cell.configure(with: model)
        return cell
    }()
    
    let authorsOfAppControllerCell: CustomMenuCell = {
        let cell = CustomMenuCell(frame: CGRect(x: 0, y: 706.3, width: 375, height: 65.7))
        cell.setSelected(selected: false)
        let model = CustomMenuCellModel(iconImage: "authorsMenuImage", name: "Авторы приложения")
        cell.configure(with: model)
        return cell
    }()
    
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0x3D495F)
        
        mainControllerCell.input = self
        discussionControllerCell.input = self
        classesControllerCell.input = self
        coursesControllerCell.input = self
        performanceControllerCell.input = self
        financeControllerCell.input = self
        progressControllerCell.input = self
        authorsOfAppControllerCell.input = self
        
        let src = UIScrollView(frame: CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height))
        src.showsVerticalScrollIndicator = false
        src.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0x3D495F)
        
        let customView = CustomView(view: src)
        customView.addButton(button: menuButton)
        customView.addImage(image: logo)
        customView.addView(view: mainControllerCell, lines: false)
        customView.addView(view: discussionControllerCell, lines: false)
        customView.addView(view: classesControllerCell, lines: false)
        customView.addView(view: coursesControllerCell, lines: false)
        customView.addView(view: performanceControllerCell, lines: false)
        customView.addView(view: financeControllerCell, lines: false)
        customView.addView(view: progressControllerCell, lines: false)
        customView.addView(view: authorsOfAppControllerCell, lines: false)
        customView.show()
        setup()
        src.contentSize = CGSize(width: src.contentSize.width, height: self.view.frame.height * 1.1)
        self.view.addSubview(src)
    }
    
    func setup() {
        mainControllerCell.frame = CGRect(x: mainControllerCell.frame.minX, y: mainControllerCell.frame.minY, width: mainControllerCell.frame.width, height: mainControllerCell.frame.height)
        discussionControllerCell.frame = CGRect(x: discussionControllerCell.frame.minX, y: mainControllerCell.frame.minY + mainControllerCell.frame.height, width: discussionControllerCell.frame.width, height: discussionControllerCell.frame.height)
        classesControllerCell.frame = CGRect(x: classesControllerCell.frame.minX, y: discussionControllerCell.frame.minY + discussionControllerCell.frame.height, width: classesControllerCell.frame.width, height: classesControllerCell.frame.height)
        coursesControllerCell.frame = CGRect(x: coursesControllerCell.frame.minX, y: classesControllerCell.frame.minY + classesControllerCell.frame.height, width: coursesControllerCell.frame.width, height: coursesControllerCell.frame.height)
        performanceControllerCell.frame = CGRect(x: performanceControllerCell.frame.minX, y: coursesControllerCell.frame.minY + coursesControllerCell.frame.height, width: performanceControllerCell.frame.width, height: performanceControllerCell.frame.height)
        financeControllerCell.frame = CGRect(x: financeControllerCell.frame.minX, y: performanceControllerCell.frame.minY + performanceControllerCell.frame.height, width: financeControllerCell.frame.width, height: financeControllerCell.frame.height)
        progressControllerCell.frame = CGRect(x: progressControllerCell.frame.minX, y: financeControllerCell.frame.minY + financeControllerCell.frame.height, width: progressControllerCell.frame.width, height: progressControllerCell.frame.height)
    }
    
    
    @objc func close() {
        if input == "Main" {
            let mainController = MainController()
            mainController.modalTransitionStyle = .crossDissolve
            self.present(mainController, animated: true, completion: nil)
        } else if input == "Discussion" {
            let discussionController = DiscussionController()
            discussionController.modalTransitionStyle = .crossDissolve
            self.present(discussionController, animated: true, completion: nil)
        } else if input == "Classes" {
            let classesController = ClassesController()
            classesController.modalTransitionStyle = .crossDissolve
            self.present(classesController, animated: true, completion: nil)
        } else if input == "Courses" {
            let coursesController = CoursesController()
            coursesController.modalTransitionStyle = .crossDissolve
            self.present(coursesController, animated: true, completion: nil)
        } else if input == "Performance" {
            let performanceController = PerformanceController()
            performanceController.modalTransitionStyle = .crossDissolve
            self.present(performanceController, animated: true, completion: nil)
        } else if input == "Finance" {
            let financeController = FinanceController()
            financeController.modalTransitionStyle = .crossDissolve
            self.present(financeController, animated: true, completion: nil)
        } else if input == "Progress" {
            let progressController = ProgressController()
            progressController.modalTransitionStyle = .crossDissolve
            self.present(progressController, animated: true, completion: nil)
        } else if input == "Authors" {
            let authorsOfAppController = AuthorsOfAppController()
            authorsOfAppController.modalTransitionStyle = .crossDissolve
            self.present(authorsOfAppController, animated: true, completion: nil)
        }
    }
    
}
