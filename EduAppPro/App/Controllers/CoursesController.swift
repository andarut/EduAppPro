//
//  CoursesController.swift
//  EduAppPro
//
//  Created by Andrey on 21/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CoursesController: UIViewController {

    let save = UserDefaults.standard
    
    var name = "Courses"
    
    let menuButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 44.7, y: 44.7, width: 60, height: 46))
        button.setBackgroundImage(UIImage(named: "MenuButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(menu), for: .touchDown)
        return button
    }()
    
    let profileButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 284.3, y: 44.7, width: 46, height: 46))
        button.setBackgroundImage(UIImage(named: "test_ava"), for: .normal)
        button.addTarget(self, action: #selector(profile), for: .touchDown)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 124.7, width: 92, height: 30))
        label.text = "Курсы"
        return label
    }()
    
    let addClassesButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 270.7, y: 707.7, width: 59.7, height: 59.7))
        button.setBackgroundImage(UIImage(named: "addDuscussionButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(addCourse), for: .touchDown)
        return button
    }()
    
    var coursesView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let coursesView = UIView(frame: CGRect(x: 0, y: 165.4, width: 375, height: 176.3))
        coursesView.backgroundColor = .white
        let content1 = CustomCoursesCell(frame: CGRect(x: 0, y: 0, width: 375, height: 112))
        content1.configure(with: CustomCoursesCellModel(mainText: """
                                                                   Дискретная
                                                                   математика
                                                                   """, smallText: "Семенов Роман Валерьевич", image: "math"))
        content1.input = self
        let content2 = CustomCoursesCell(frame: CGRect(x: 0, y: content1.frame.minY + content1.frame.height, width: 375, height: 112))
        content2.configure(with: CustomCoursesCellModel(mainText: """
                                                                   Программирование
                                                                   на C#
                                                                   """, smallText: "Рахов Александр Ярославович", image: "c#"))
        content2.input = self
        coursesView.addSubview(content1)
        coursesView.addSubview(content2)
        let height = content1.frame.height + content2.frame.height
        coursesView.frame = CGRect(x: coursesView.frame.minX, y: coursesView.frame.minY, width: coursesView.frame.width, height: height / CGFloat(save.double(forKey: "scaleX")))

        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xF4F6FA)
        let src = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        src.showsVerticalScrollIndicator = false
        let customView = CustomView(view: src)
        customView.addButton(button: menuButton)
        customView.addButton(button: profileButton)
        customView.addButton(button: addClassesButton)
        customView.addLabel(label: label, type: .big)
        customView.addView(view: coursesView, lines: false)
        customView.show()
        
        src.contentSize = CGSize(width: src.contentSize.width, height: (self.view.frame.height) * 1.1)
        self.view.addSubview(src)
    }
    
    @objc func addCourse() {
        let newCourseController = NewCourseController()
        newCourseController.modalTransitionStyle = .crossDissolve
        self.present(newCourseController, animated: true, completion: nil)
    }
    
    @objc func menu() {
        let menu = MenuController()
        menu.modalTransitionStyle = .crossDissolve
        menu.input = "Courses"
        menu.coursesControllerCell.setSelected(selected: true)
        self.present(menu, animated: true, completion: nil)
    }
    
    @objc func profile() {
        let profileController = ProfileController()
        profileController.returnScreenName = "Курсы"
        profileController.modalTransitionStyle = .crossDissolve
        self.present(profileController, animated: true, completion: nil)
    }
    
}
