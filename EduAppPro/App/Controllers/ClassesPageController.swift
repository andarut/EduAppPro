//
//  ClassesPageController.swift
//  EduAppPro
//
//  Created by Andrey on 23/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ClassesPageController: UIViewController {

    var input = ""
    
    var name = ""
    
    var date = ""
    
    let save = UserDefaults.standard
    
    let pointer: UIImageView = {
        let pointer = UIImageView(frame: CGRect(x: 29, y: 45.4, width: 6.9, height: 12.1))
        pointer.image = UIImage(named: "Pointer")
        return pointer
    }()
    
    let returnToButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 24.7, y: 44.8, width: 110, height: 13.4))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.addTarget(self, action: #selector(returnTo), for: .touchDown)
        button.setTitle("Занятия", for: .normal)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 43.4, y: 82.3, width: 275, height: 82))
        label.numberOfLines = 0
        return label
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 42, y: 168, width: 228, height: 18))
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let teacherView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 194.8, width: 375, height: 85.9))
        view.backgroundColor = .white
        let content = CustomTeacherCell(frame: CGRect(x: view.frame.minX, y: view.frame.minX, width: view.frame.width, height: view.frame.height))
        content.configure(with: CustomTeacherCellModel(image: "test_ava_2", mainText: "Семенов Роман Валерьевич"))
        view.addSubview(content)
        let height = content.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()
    
    let mainView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 298, width: 375, height: 165.4))
        view.backgroundColor = .white
        let content = CustomClassesPageCell(frame: CGRect(x: 0, y: 0, width: 375, height: 160.5))
        content.configure(with: CustomClassesPageCellModel(theme: "Системы счисления", score: 100, allScore: 100, haveEvaluation: true, evaluation: 5))
        view.addSubview(content)
        let height = content.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnToButton.setTitle(input, for: .normal)
        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xF4F6FA)
        let customView = CustomView(view: self.view)
        customView.addImage(image: pointer)
        customView.addButton(button: returnToButton)
        customView.addView(view: mainView, lines: true)
        label.text = name
        smallLabel.text = date
        print("name: " + name)
        print("date: " + date)
        
        customView.addLabel(label: label, type: .big)
        customView.addLabel(label: smallLabel, type: .small)
        customView.addView(view: teacherView, lines: true)
        customView.show()
        setup()
        
        
    }
    
    func setup() {
        teacherView.frame = CGRect(x: teacherView.frame.minX, y: teacherView.frame.minY, width: teacherView.frame.width, height: teacherView.frame.height / CGFloat(save.double(forKey: "scaleX")))
        mainView.frame = CGRect(x: mainView.frame.minX, y: teacherView.frame.minY + teacherView.frame.height + 20, width: mainView.frame.width, height: mainView.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func returnTo() {
        if input == "Главная" {
            let mainController = MainController()
            mainController.modalTransitionStyle = .crossDissolve
            self.present(mainController, animated: true, completion: nil)
        } else if input == "Занятия" {
            let classesController = ClassesController()
            classesController.modalTransitionStyle = .crossDissolve
            self.present(classesController, animated: true, completion: nil)
        }
    }
    
}
