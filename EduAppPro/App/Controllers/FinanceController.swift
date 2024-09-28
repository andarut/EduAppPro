//
//  FinanceController.swift
//  EduAppPro
//
//  Created by Andrey on 22/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class FinanceController: UIViewController {
    
    var balance = -100
    
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
        let label = UILabel(frame: CGRect(x: 43.3, y: 124.7, width: 140, height: 23))
        label.text = "Финансы"
        return label
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.6, y: 170.7, width: 81, height: 18))
        label.text = "Баланс:"
        return label
    }()
    
    let financeView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 207, width: 375, height: 83.4))
        view.backgroundColor = .white
        return view
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 111.4, y: 23, width: 200, height: 39.5))
        return label
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
        customView.addLabel(label: smallLabel, type: .medium)
        balanceLabel.text = String(balance) + " руб"
        balanceLabel.font = UIFont(name: "Roboto-Regular", size: CGFloat(save.integer(forKey: "width") / 9))
        if balance < 0 {
            balanceLabel.textColor = .red
        } else if balance > 0 {
            balanceLabel.textColor = .green
        }
        financeView.addSubview(balanceLabel)
        customView.addView(view: financeView, lines: true)
    
        customView.show()
        setup()
        src.contentSize = CGSize(width: src.contentSize.width, height: (self.view.frame.height) * 1.1)
        self.view.addSubview(src)
    }
    
    func setup() {
        balanceLabel.frame = CGRect(x: balanceLabel.frame.minX * CGFloat(save.double(forKey: "scaleX")), y: balanceLabel.frame.minY, width: balanceLabel.frame.width, height: balanceLabel.frame.height)
        financeView.frame = CGRect(x: financeView.frame.minX, y: financeView.frame.minY, width: financeView.frame.width, height: financeView.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func menu() {
        let menu = MenuController()
        menu.modalTransitionStyle = .crossDissolve
        menu.input = "Finance"
        menu.financeControllerCell.setSelected(selected: true)
        self.present(menu, animated: true, completion: nil)
    }
    
    @objc func profile() {
        let profileController = ProfileController()
        profileController.returnScreenName = "Финансы"
        profileController.modalTransitionStyle = .crossDissolve
        self.present(profileController, animated: true, completion: nil)
    }
    
}
