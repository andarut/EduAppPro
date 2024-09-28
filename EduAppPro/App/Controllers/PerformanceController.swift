//
//  PerformanceController.swift
//  EduAppPro
//
//  Created by Andrey on 21/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class PerformanceController: UIViewController {

    let save = UserDefaults.standard
    
    var name = "Performance"
    
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
        let label = UILabel(frame: CGRect(x: 45, y: 124.7, width: 220, height: 21.7))
        label.text = "Успеваемость"
        return label
    }()
    
    let firstCourseLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 43.4, y: 170.7, width: 259.6, height: 20.7))
        label.text = "Дискретная математика"
        return label
    }()
    
    let firstCourseView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 196.8, width: 375, height: 162))
        view.backgroundColor = .white
        let part1 = CustomPerformanceCell(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        part1.configure(width: CustomPerformanceCellModel(parts: 1, gradePointAverage: 4.5, total: "Часть не закончена", haveEvaluationInTotal: false, haveGradePointAverage: true, haveTotal: false, haveEvaluations: true, evaluations: [5, 4, 3, 2]))
        view.addSubview(part1)
        let height = part1.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()
    
    let lastCourseLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.8, y: 374.7, width: 278, height: 21.7))
        label.text = "Программирование на C#"
        return label
    }()
    
    let lastCourseView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 401.1, width: 375, height: 162))
        view.backgroundColor = .white
        let part1 = CustomPerformanceCell(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        part1.configure(width: CustomPerformanceCellModel(parts: 1, gradePointAverage: 4.5, total: "5", haveEvaluationInTotal: true, haveGradePointAverage: true, haveTotal: true, haveEvaluations: true, evaluations: [5, 4, 3, 2]))
        let part2 = CustomPerformanceCell(frame: CGRect(x: 0, y: part1.frame.minY + part1.frame.height, width: view.frame.width, height: view.frame.height))
        part2.configure(width: CustomPerformanceCellModel(parts: 2, gradePointAverage: 4.5, total: "Часть не закончена", haveEvaluationInTotal: false, haveGradePointAverage: true, haveTotal: false, haveEvaluations: true, evaluations: [5, 4, 3, 2]))
        view.addSubview(part1)
        view.addSubview(part2)
        let height = part1.frame.height + part2.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xF4F6FA)
        let src = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        src.showsVerticalScrollIndicator = false
        let customView = CustomView(view: src)
        customView.addButton(button: menuButton)
        customView.addButton(button: profileButton)
        customView.addLabel(label: label, type: .big)
        customView.addLabel(label: firstCourseLabel, type: .medium)
        customView.addView(view: firstCourseView, lines: true)
        customView.addLabel(label: lastCourseLabel, type: .medium)
        customView.addView(view: lastCourseView, lines: true)
        customView.show()
        setup()
        src.contentSize = CGSize(width: src.contentSize.width, height: (lastCourseView.frame.height + lastCourseView.frame.minY) * 1.1)
        self.view.addSubview(src)
    }
    
    func setup() {
        firstCourseView.frame = CGRect(x: firstCourseView.frame.minX, y: firstCourseLabel.frame.minY + 25.6, width: lastCourseView.frame.width, height: firstCourseView.frame.height / CGFloat(save.double(forKey: "scaleX")))
        lastCourseLabel.frame = CGRect(x: lastCourseLabel.frame.minX, y: firstCourseView.frame.minY + firstCourseView.frame.height + 14, width: lastCourseLabel.frame.width, height: lastCourseLabel.frame.height)
        lastCourseView.frame = CGRect(x: lastCourseView.frame.minX, y: lastCourseLabel.frame.minY + 25.6, width: lastCourseView.frame.width, height: lastCourseView.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func menu() {
        let menu = MenuController()
        menu.modalTransitionStyle = .crossDissolve
        menu.input = "Performance"
        menu.performanceControllerCell.setSelected(selected: true)
        self.present(menu, animated: true, completion: nil)
    }
    
    @objc func profile() {
        let profileController = ProfileController()
        profileController.returnScreenName = "Оценки"
        profileController.modalTransitionStyle = .crossDissolve
        self.present(profileController, animated: true, completion: nil)
    }
    



}
