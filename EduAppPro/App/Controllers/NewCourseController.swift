//
//  NewCourseController.swift
//  EduAppPro
//
//  Created by Andrey on 30/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class NewCourseController: UIViewController {

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
        button.setTitle("Курсы", for: .normal)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 43.5, y: 81.7, width: 254, height: 27.6))
        label.text = "Запись на курсы"
        return label
    }()
    
    let newCoursesView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 145.4, width: 375, height: 368))
        view.backgroundColor = .white
        let content1 = CustomNewCourseCell(frame: CGRect(x: 0, y: 0, width: 375, height: 184.8))
        content1.configure(with: CustomNewCourseModel(image: "math", mainText: """
                                                                                Дискретная
                                                                                математика
                                                                                """, teacherText: "Семенов Роман Валерьевич", description: """
                                                                                                                                            Здесь должна была быть
                                                                                                                                            рыбка...
                                                                                                                                            """, apply: false))
        view.addSubview(content1)
        let content2 = CustomNewCourseCell(frame: CGRect(x: 0, y: content1.frame.minY + content1.frame.height, width: 375, height: 184.8))
        content2.configure(with: CustomNewCourseModel(image: "math", mainText: """
                                                                                Страдания от
                                                                                демона
                                                                                """, teacherText: "Рахов Александр Ярославович", description: """
                                                                                                                                               Здесь должна была быть
                                                                                                                                               рыбка...
                                                                                                                                               """, apply: true))
        view.addSubview(content2)
        let height = content1.frame.height + content2.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xF4F6FA)
        let src = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        src.showsVerticalScrollIndicator = false
        let customView = CustomView(view: src)
        customView.addView(view: pointer, lines: false)
        customView.addView(view: returnToButton, lines: false)
        customView.addLabel(label: label, type: .big)
        customView.addView(view: newCoursesView, lines: false)
        customView.show()
        setup()
        self.view.addSubview(src)
    }
    
    func setup() {
        newCoursesView.frame = CGRect(x: newCoursesView.frame.minX, y: newCoursesView.frame.minY, width: newCoursesView.frame.width, height: newCoursesView.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func returnTo() {
        let coursesController = CoursesController()
        coursesController.modalTransitionStyle = .crossDissolve
        self.present(coursesController, animated: true, completion: nil)
    }
    

}
