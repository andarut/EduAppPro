//
//  CoursesPageController.swift
//  EduAppPro
//
//  Created by Andrey on 30/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CoursesPageController: UIViewController {

    var name = ""
    
    var teacher = ""
    
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
        let label = UILabel(frame: CGRect(x: 43.5, y: 71.7, width: 275, height: 80))
        label.numberOfLines = 0
        return label
    }()
    
    let coursesPageCellType1View: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 265.7, width: 375, height: 209.1))
        view.backgroundColor = .white
        let content = CustomCoursesPageCellType1(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        content.configure(with: CustomCoursesPageCellType1Model(evaluations: 10, gradePointAverage: 5.0, haveTotal: false, total: 0, classes: 3, allClasses: 14))
        view.addSubview(content)
        let height = content.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()
    
    let coursesPageCellType2View: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 512.8, width: 375, height: 252.2))
        view.backgroundColor = .white
        let content1 = CustomCoursesPageCellType2(frame: CGRect(x: 0, y: 0, width: 375, height: 120))
        content1.configure(with: CustomCoursesPageCellType2Model(smallText: "5 октября, 17:10 – 18:40", type: .classwork, mainText: """
                                                                                                                                     Действия с данными,
                                                                                                                                     битовые операции.
                                                                                                                                     Представление вещественных
                                                                                                                                     чисел в компьютере
                                                                                                                                     """))
        let content2 = CustomCoursesPageCellType2(frame: CGRect(x: 0, y: content1.frame.minY + content1.frame.height + 1, width: 375, height: 70))
        content2.configure(with: CustomCoursesPageCellType2Model(smallText: "5 октября, 17:10 – 18:40", type: .homework, mainText: """
                                                                                                                                    Подготовка к контрольной
                                                                                                                                    работе
                                                                                                                                    """))
        let content3 = CustomCoursesPageCellType2(frame: CGRect(x: 0, y: content2.frame.minY + content2.frame.height + 1, width: 375, height: 70))
        content3.configure(with: CustomCoursesPageCellType2Model(smallText: "26 октября, 17:10 – 18:40", type: .another, mainText: """
                                                                                                                                    Полусеместровая контрольная
                                                                                                                                    работа
                                                                                                                                    """))
        view.addSubview(content1)
        view.addSubview(content2)
        view.addSubview(content3)
        let height = content1.frame.height + content2.frame.height + content3.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()
    
    let classesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 43.2, y: 487.9, width: 100, height: 20))
        label.text = "Занятия"
        return label
    }()
    
    var teacherView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = """
                      \(name)
                      """
        
        teacherView = UIView(frame: CGRect(x: 0, y: 161.8, width: 375, height: 85.9))
        teacherView.backgroundColor = .white
        let content = CustomTeacherCell(frame: CGRect(x: teacherView.frame.minX, y: teacherView.frame.minX, width: teacherView.frame.width, height: teacherView.frame.height))
        content.configure(with: CustomTeacherCellModel(image: "test_ava_2", mainText: teacher))
        teacherView.addSubview(content)
        let height = content.frame.height
        teacherView.frame = CGRect(x: teacherView.frame.minX, y: teacherView.frame.minY, width: teacherView.frame.width, height: height)
        
        
        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xF4F6FA)
        let src = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        src.showsVerticalScrollIndicator = false
        let customView = CustomView(view: src)
        customView.addImage(image: pointer)
        customView.addButton(button: returnToButton)
        customView.addLabel(label: label, type: .big)
        customView.addView(view: teacherView, lines: true)
        customView.addView(view: coursesPageCellType1View, lines: true)
        customView.addView(view: coursesPageCellType2View, lines: true)
        customView.addLabel(label: classesLabel, type: .medium)
        customView.show()
        setup()
        self.view.addSubview(src)
    }
    
    @objc func returnTo() {
        print("returnTo")
        let coursesController = CoursesController()
        coursesController.modalTransitionStyle = .crossDissolve
        self.present(coursesController, animated: true, completion: nil)
    }
    
    func setup() {
        teacherView.frame = CGRect(x: teacherView.frame.minX, y: teacherView.frame.minY, width: teacherView.frame.width, height: teacherView.frame.height / CGFloat(save.double(forKey: "scaleX")))
        coursesPageCellType1View.frame = CGRect(x: coursesPageCellType1View.frame.minX, y: teacherView.frame.minY + teacherView.frame.height + 20, width: coursesPageCellType1View.frame.width, height: coursesPageCellType1View.frame.height / CGFloat(save.double(forKey: "scaleX")))
        classesLabel.frame = CGRect(x: classesLabel.frame.minX, y: coursesPageCellType1View.frame.minY + coursesPageCellType1View.frame.height + 20, width: classesLabel.frame.width, height: classesLabel.frame.height)
        coursesPageCellType2View.frame = CGRect(x: coursesPageCellType2View.frame.minX, y: classesLabel.frame.minY + classesLabel.frame.height + 10, width: coursesPageCellType2View.frame.width, height: coursesPageCellType2View.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
}
