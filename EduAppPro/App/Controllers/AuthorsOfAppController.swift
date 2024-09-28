//
//  AuthorsOfAppController.swift
//  EduAppPro
//
//  Created by Andrey on 24/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class AuthorsOfAppController: UIViewController {

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
        label.text = "Авторы приложения"
        return label
    }()
    
    let me: CustomPeopleCell = {
        let cell = CustomPeopleCell(frame: CGRect(x: 0, y: 152, width: 375, height: 90))
        cell.configure(with: CustomPeopleCellModel(mainText: "Арутюнян Андрей", smallText: "Программист", image: "my_ava"))
        return cell
    }()
    
    let danil: CustomPeopleCell = {
        let cell = CustomPeopleCell(frame: CGRect(x: 0, y: 240, width: 375, height: 90))
        cell.configure(with: CustomPeopleCellModel(mainText: "Белов Даниил", smallText: "Дизайнер", image: "danil_ava"))
        return cell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let customView = CustomView(view: self.view)
        customView.addImage(image: pointer)
        customView.addButton(button: returnToButton)
        customView.addLabel(label: label, type: .big)
        customView.addView(view: me, lines: false)
        customView.addView(view: danil, lines: false)
        customView.show()
        setup()
    }
    
    func setup() {
        me.frame = CGRect(x: me.frame.minX, y: me.frame.minY, width: me.frame.width, height: me.frame.height / CGFloat(save.double(forKey: "scaleX")))
        danil.frame = CGRect(x: danil.frame.minX, y: me.frame.minY + me.frame.height, width: danil.frame.width, height: danil.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func returnTo() {
        let menu = MenuController()
        menu.modalTransitionStyle = .crossDissolve
        menu.input = "Authors"
        menu.authorsOfAppControllerCell.setSelected(selected: true)
        self.present(menu, animated: true, completion: nil)
    }

}
