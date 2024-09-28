//
//  MainController.swift
//  EduAppPro
//
//  Created by Andrey on 08/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
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
        let label = UILabel(frame: CGRect(x: 45, y: 124.7, width: 117.7, height: 21.7))
        label.text = "Главная"
        return label
    }()
    
    let NearestСlassesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.6, y: 170.5, width: 214.1, height: 16.5))
        label.text = "Ближайшие занятия"
        return label
    }()
    
    let NearestСlassesView = UIView()
    
    
    
    let PracticingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 43.4, y: 460.7, width: 147.9, height: 20.7))
        label.text = "Дорешивание"
        return label
    }()
    
    let PracticingView: UIView = {
        let save = UserDefaults.standard
        let view = UIView(frame: CGRect(x: 0, y: 555.4, width: 375, height: 176.3))
        view.backgroundColor = .white
        let content1 = CustomMainCell(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
        content1.configure(with: CustomCellModel(smallText: "7 октября, 17:10 – 18:40", mainText: "Программирование на C++", haveEvaluation: false, haveClasswork: true, haveHomework: true, textClip: false, selectedText: ""))
        let content2 = CustomMainCell(frame: CGRect(x: 0, y: Int(content1.frame.minY + 100), width: Int(375), height: 75))
        content2.configure(with: CustomCellModel(smallText: "8 октября, 17:10 – 18:40", mainText: "Программирование на C#", haveEvaluation: false, haveClasswork: false, haveHomework: true, textClip: false, selectedText: ""))
        view.addSubview(content1)
        view.addSubview(content2)
        let height = content1.frame.height + content2.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()
    
    let BuzzEventLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 43.4, y: 654.6, width: 233.4, height: 17.4))
        label.text = "Живая лента событий"
        return label
    }()
    
    let BuzzEventView: UIView = {
        let save = UserDefaults.standard
        let view = UIView(frame: CGRect(x: 0, y: 680.4, width: 375, height: 176.3))
        view.backgroundColor = .white
        let content1 = CustomMainCell(frame: CGRect(x: 0, y: 0, width: 375, height: 50))
        content1.configure(with: CustomCellModel(smallText: "13 дней назад", mainText: """
                                                Текстовое сообщение и Ссылка
                                                и ещё ссылочка
                                                """
            , haveEvaluation: false, haveClasswork: false, haveHomework: false, textClip: true, selectedText: "Ссылка"))
        let content2 = CustomMainCell(frame: CGRect(x: 0, y: Int(content1.frame.minY + 65), width: 375, height: 85))
        content2.configure(with: CustomCellModel(smallText: "15 минут назад", mainText: "Программирование на C#", haveEvaluation: true, haveClasswork: false, haveHomework: false, textClip: false, selectedText: ""))
        view.addSubview(content1)
        view.addSubview(content2)

        let height = content1.frame.height + content2.frame.height
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: height)
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NearestСlassesView.frame = CGRect(x: 0, y: 195.4, width: 375, height: 210)
        NearestСlassesView.backgroundColor = .white
        let content1 = CustomMainCell(frame: CGRect(x: 0, y: 0, width: 375, height: 50))
        content1.configure(with: CustomCellModel(smallText: "10 октября, 17:10 – 18:40", mainText: "Дискретная математика", haveEvaluation: false, haveClasswork: false, haveHomework: false, textClip: false, selectedText: ""))
        content1.input = self
        let content2 = CustomMainCell(frame: CGRect(x: 0, y: Int(content1.frame.minY + 50), width: 375, height: 100))
        content2.configure(with: CustomCellModel(smallText: "12 октября, 17:10 – 18:40", mainText: "Программирование на C#", haveEvaluation: false, haveClasswork: true, haveHomework: true, textClip: false, selectedText: ""))
        content2.input = self
        let content3 = CustomMainCell(frame: CGRect(x: 0, y: Int(content2.frame.minY + 100), width: 375, height: 75))
        content3.configure(with: CustomCellModel(smallText: "15 октября, 17:10 – 18:40", mainText: "Программирование на C#", haveEvaluation: false, haveClasswork: false, haveHomework: true, textClip: false, selectedText: ""))
        content3.input = self
        NearestСlassesView.addSubview(content1)
        NearestСlassesView.addSubview(content2)
        NearestСlassesView.addSubview(content3)
        let height = (content1.frame.height + content2.frame.height + content3.frame.height)
        NearestСlassesView.frame = CGRect(x: NearestСlassesView.frame.minX, y: NearestСlassesView.frame.minY, width: NearestСlassesView.frame.width, height: height)
        
        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xF4F6FA)
        self.hideKeyboardWhenTappedAround()
        let src = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        src.showsVerticalScrollIndicator = false
        let view = CustomView(view: src)
        view.addButton(button: menuButton)
        view.addButton(button: profileButton)
        view.addLabel(label: label, type: .big)
        view.addLabel(label: NearestСlassesLabel, type: .medium)
        view.addView(view: NearestСlassesView, lines: true)
        view.addLabel(label: PracticingLabel, type: .medium)
        view.addView(view: PracticingView, lines: true)
        view.addLabel(label: BuzzEventLabel, type: .medium)
        view.addView(view: BuzzEventView, lines: true)
        view.show()
        setup()
        src.contentSize = CGSize(width: src.contentSize.width, height: (BuzzEventView.frame.height + BuzzEventView.frame.minY) * 1.1)
        self.view.addSubview(src)
        
    }
    
    func setup() {
        NearestСlassesView.frame = CGRect(x: NearestСlassesView.frame.minX, y: NearestСlassesLabel.frame.minY + 24.9, width: NearestСlassesView.frame.width, height: NearestСlassesView.frame.height / CGFloat(save.double(forKey: "scaleX")))
        PracticingLabel.frame = CGRect(x: PracticingLabel.frame.minX, y: NearestСlassesView.frame.minY + NearestСlassesView.frame.height + 14, width: PracticingLabel.frame.width, height: PracticingLabel.frame.height)
        PracticingView.frame = CGRect(x: PracticingView.frame.minX, y: PracticingLabel.frame.minY + 24.7, width: PracticingView.frame.width, height: PracticingView.frame.height / CGFloat(save.double(forKey: "scaleX")))
        BuzzEventLabel.frame = CGRect(x: BuzzEventLabel.frame.minX, y: PracticingView.frame.minY + PracticingView.frame.height + 15.9, width: BuzzEventLabel.frame.width, height: BuzzEventLabel.frame.height)
        BuzzEventView.frame = CGRect(x: BuzzEventView.frame.minX, y: BuzzEventLabel.frame.minY + 22.6, width: BuzzEventView.frame.width, height: BuzzEventView.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func menu() {
        let menu = MenuController()
        menu.modalTransitionStyle = .crossDissolve
        menu.input = "Main"
        menu.mainControllerCell.setSelected(selected: true)
        self.present(menu, animated: true, completion: nil)
    }
    
    @objc func profile() {
        let profileController = ProfileController()
        profileController.returnScreenName = "Главная"
        profileController.modalTransitionStyle = .crossDissolve
        self.present(profileController, animated: true, completion: nil)
    }
    
}
