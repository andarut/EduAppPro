//
//  ForgotPasswordController.swift
//  EduAppPro
//
//  Created by Andrey on 21/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class PasswordRecoveryController: UIViewController {

    var customView = CustomView(view: UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)))
    
    let pointer: UIImageView = {
        let pointer = UIImageView(frame: CGRect(x: 29, y: 45.4, width: 6.9, height: 12.1))
        pointer.image = UIImage(named: "Pointer")
        return pointer
    }()
    
    let returnToButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 44.7, y: 44.8, width: 50 , height: 13.4))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.setTitle("Вход", for: .normal)
        button.addTarget(self, action: #selector(returnTo), for: .touchDown)
        return button
    }()
    
    let returnToButton2: UIButton = {
        let button = UIButton(frame: CGRect(x: 44.7, y: 44.8, width: 160 , height: 13.4))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.setTitle("Изменить пароль", for: .normal)
        button.addTarget(self, action: #selector(returnToTo), for: .touchDown)
        return button
    }()
    
    let textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 369.9, width: 285.7, height: 46))
        textField.placeholder = "+7"
        return textField
    }()
    
    let textField2: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 369.9, width: 285.7, height: 46))
        textField.placeholder = "Код из SMS"
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
        button.setTitle("Продолжить", for: .normal)
        button.setBackgroundImage(UIImage(named: "GreenButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(nextTo), for: .touchDown)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton(frame: CGRect(x: 34.7, y: 440.7, width: 305.7, height: 46))
        button.setTitle("Восстановить", for: .normal)
        button.setBackgroundImage(UIImage(named: "GreenButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(nextToTo), for: .touchDown)
        return button
    }()
    
    let smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 43.6, y: 245.9, width: 300, height: 100))
        label.text = """
                      Укажите свой номер телефона.
                      На него придёт сообщение с
                      кодом, который надо будет
                      указать далее
                      """
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        customView = CustomView(view: self.view)
        customView.addImage(image: pointer)
        customView.addButton(button: returnToButton)
        customView.addLabel(label: label, type: .big)
        customView.addTextField(textField: textField)
        customView.addLabel(label: smallLabel, type: .small)
        customView.addButton(button: button)
        customView.addButton(button: button2)
        customView.show()
    }
    
    @objc func returnTo() {
        let loginController = LoginController()
        loginController.modalTransitionStyle = .crossDissolve
        self.present(loginController, animated: true, completion: nil)
    }
    
    @objc func nextTo() {
        
        returnToButton.alpha = 0
        button.alpha = 0
        button2.alpha = 1
        returnToButton2.alpha = 1
        self.textField.placeholder = "Код из SMS"
        self.returnToButton2.setTitle("Изменить номер", for: .normal)
        self.smallLabel.text = """
                           Для продолжения укажите
                           здесь код, которы пришёл вам
                           по SMS
                           """
        
    }
    
    @objc func nextToTo() {
        let newPasswordController = NewPasswordController()
        newPasswordController.modalTransitionStyle = .crossDissolve
        self.present(newPasswordController, animated: true, completion: nil)
    }
    
    @objc func returnToTo() {
        returnToButton2.alpha = 0
        button2.alpha = 0
        self.smallLabel.alpha = 1
        returnToButton.alpha = 1
        button.alpha = 1
        self.returnToButton.setTitle("Вход", for: .normal)
        customView.show()
        self.textField.placeholder = "+7"
        self.smallLabel.text = """
        Укажите свой номер телефона.
        На него придёт сообщение с
        кодом, который надо будет
        указать далее
        """
    }
    
    @objc func nextToToTo() {
        let alert = UIAlertController(title: "Успешно!", message: "Ваш пароль изменен!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: goToLoginController))
        self.present(alert, animated: true, completion: nil)
    }

    func goToLoginController(alert: UIAlertAction!) {
        let loginController = LoginController()
        loginController.modalTransitionStyle = .crossDissolve
        self.present(loginController, animated: true, completion: nil)
    }



}
