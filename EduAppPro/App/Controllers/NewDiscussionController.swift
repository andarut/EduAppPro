//
//  NewDiscussionController.swift
//  EduAppPro
//
//  Created by Andrey on 24/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class NewDiscussionController: UIViewController {
    
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
        button.setTitle("Назад", for: .normal)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 42.9, y: 82.3, width: 320, height: 29))
        label.text = "Новое обсуждение"
        return label
    }()
    
    let firstTeacher: CustomPeopleCell = {
        let cell = CustomPeopleCell(frame: CGRect(x: 0, y: 152, width: 375, height: 90))
        cell.configure(with: CustomPeopleCellModel(mainText: "Рахов Александр", smallText: "Программирование на C#", image: "test_round_ava"))
        return cell
    }()
    
    let lastTeacher: CustomPeopleCell = {
        let cell = CustomPeopleCell(frame: CGRect(x: 0, y: 240, width: 375, height: 90))
        cell.configure(with: CustomPeopleCellModel(mainText: "Семенов Роман", smallText: "Дискретная математика", image: "test_round_ava"))
        return cell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let customView = CustomView(view: self.view)
        customView.addImage(image: pointer)
        customView.addButton(button: returnToButton)
        customView.addLabel(label: label, type: .big)
        customView.addView(view: firstTeacher, lines: false)
        customView.addView(view: lastTeacher, lines: false)
        customView.show()
        setup()
    }
    
    func setup() {
        firstTeacher.frame = CGRect(x: firstTeacher.frame.minX, y: firstTeacher.frame.minY, width: firstTeacher.frame.width, height: firstTeacher.frame.height / CGFloat(save.double(forKey: "scaleX")))
        lastTeacher.frame = CGRect(x: lastTeacher.frame.minX, y: firstTeacher.frame.minY + firstTeacher.frame.height, width: lastTeacher.frame.width, height: lastTeacher.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func returnTo() {
        let discussionController = DiscussionController()
        discussionController.modalTransitionStyle = .crossDissolve
        self.present(discussionController, animated: true, completion: nil)
    }
    
}
