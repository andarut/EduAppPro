//
//  NewPasswordController.swift
//  EduAppPro
//
//  Created by Andrey on 22/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class NewPasswordController: UIViewController {

    let pointer: UIImageView = {
        let pointer = UIImageView(frame: CGRect(x: 29, y: 45.4, width: 6.9, height: 12.1))
        pointer.image = UIImage(named: "Pointer")
        return pointer
    }()
    
    let returnToButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 44.7, y: 44.8, width: 160 , height: 13.4))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.setTitle("Изменить пароль", for: .normal)
        button.addTarget(self, action: #selector(returnTo), for: .touchDown)
        return button
    }()
    
    let newPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 315.7, width: 285.7, height: 46))
        textField.placeholder = "Новый пароль"
        return textField
    }()
    
    let replayNewPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 369.9, width: 285.7, height: 46))
        textField.placeholder = "Повтор нового пароля"
        return textField
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.2, y: 42.3, width: 245, height: 120))
        label.text = """
        Восстановление
        пароля
        """
        label.numberOfLines = 0
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 34.7, y: 440.7, width: 305.7, height: 46))
        button.setTitle("Восстановить", for: .normal)
        button.setBackgroundImage(UIImage(named: "GreenButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(nextTo), for: .touchDown)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        let customView = CustomView(view: self.view)
        customView.addImage(image: pointer)
        customView.addButton(button: returnToButton)
        customView.addTextField(textField: newPasswordTextField)
        customView.addTextField(textField: replayNewPasswordTextField)
        customView.addLabel(label: label, type: .big)
        customView.addButton(button: button)
        customView.show()
    }
    
    @objc func returnTo() {
        let passwordRecoveryController = PasswordRecoveryController()
        passwordRecoveryController.modalTransitionStyle = .crossDissolve
        self.present(passwordRecoveryController, animated: true, completion: nil)
    }
    
    @objc func nextTo() {
        print("next to")
    }
    

  

}
