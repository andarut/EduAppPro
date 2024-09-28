//
//  ProgressController.swift
//  EduAppPro
//
//  Created by Andrey on 22/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ProgressController: UIViewController {

    let save = UserDefaults.standard
    
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
        let label = UILabel(frame: CGRect(x: 43.2, y: 124.7, width: 200, height: 27))
        label.text = "Достижения"
        return label
    }()
    
    let progressView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 165.4, width: 375, height: 165.4))
        view.backgroundColor = .white
        let content1 = CustomProgressCell(frame: CGRect(x: 0, y: 0, width: 375, height: 112.5))
        content1.configure(with: CustomProgressCellModel(image: "test_progress", smallText: "Получена 17 ноября", mainText: "Стабильная шишка", mediumText: "Посетить 5 занятий подряд", open: true, percents: 100))
        let content2 = CustomProgressCell(frame: CGRect(x: 0, y: content1.frame.minY + content1.frame.height - 5, width: 375, height: 112.5))
        content2.configure(with: CustomProgressCellModel(image: "test_progress_2", smallText: "", mainText: "", mediumText: "Правильно ответить на 512 вопросов в тестах", open: false, percents: 10))
        let height = content1.frame.height + content2.frame.height
        view.addSubview(content1)
        view.addSubview(content2)
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
        customView.addView(view: progressView, lines: true)
        customView.show()
        setup()
        src.contentSize = CGSize(width: src.contentSize.width, height: (self.view.frame.height) * 1.1)
        self.view.addSubview(src)
    }
    
    func setup() {
        progressView.frame = CGRect(x: progressView.frame.minX / CGFloat(save.double(forKey: "scaleX")), y: progressView.frame.minY, width: progressView.frame.width, height: progressView.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func menu() {
        let menu = MenuController()
        menu.modalTransitionStyle = .crossDissolve
        menu.input = "Progress"
        menu.progressControllerCell.setSelected(selected: true)
        self.present(menu, animated: true, completion: nil)
    }
    
    @objc func profile() {
        let profileController = ProfileController()
        profileController.returnScreenName = "Достижения"
        profileController.modalTransitionStyle = .crossDissolve
        self.present(profileController, animated: true, completion: nil)
    }
    


}
