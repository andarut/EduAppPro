//
//  ConfirmationOfRegistrationController.swift
//  EduAppPro
//
//  Created by Andrey on 07/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ConfirmationOfRegistrationController: UIViewController {

    let returnToChangeDataButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 45, y: 44.6, width: 160, height: 13.6))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.setTitle("Изменить данные", for: .normal)
        button.addTarget(self, action: #selector(returnToChangeData), for: .touchDown)
        return button
    }()
    
    let pointer: UIImageView = {
        let pointer = UIImageView(frame: CGRect(x: 29, y: 45.4, width: 6.9, height: 12.1))
        pointer.image = UIImage(named: "Pointer")
        return pointer
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.2, y: 82.3, width: 189.8, height: 27))
        label.text = "Регистрация"
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.8, y: 282.3, width: 300, height: 66.5))
        label.numberOfLines = 0
        label.text = """
        На ваш телефон отправлен код
        по СМС, укажите его ниже
        """
        return label
    }()
    
    let codeTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 369.9, width: 285.7, height: 46))
        textField.placeholder = " " + "Код из СМС"
        textField.keyboardType = UIKeyboardType.phonePad
        return textField
    }()
    
    let confirmationButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 34.7, y: 440.7, width: 305.7, height: 46))
        button.setTitle(" " + "Подтвердить", for: .normal)
        button.setBackgroundImage(UIImage(named: "GreenButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(confirmation), for: .touchDown)
        return button
    }()
    
    let havenotcodeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 36.5, y: 510.2, width: 175.3, height: 19.2))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.setTitle("Я не получил(а) код", for: .normal)
        button.addTarget(self, action: #selector(havenotcode), for: .touchDown)
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        let view = CustomView(view: self.view)
        view.addImage(image: pointer)
        view.addLabel(label: label, type: .big)
        view.addButton(button: returnToChangeDataButton)
        view.addLabel(label: textLabel, type: .small)
        view.addTextField(textField: codeTextField)
        view.addButton(button: confirmationButton)
        view.addButton(button: havenotcodeButton)
        view.show()
        
    }
    
    @objc func returnToChangeData() {
        let registrationController = RegistrationController()
        registrationController.modalTransitionStyle = .crossDissolve
        self.present(registrationController, animated: true, completion: nil)
    }
    
    @objc func confirmation() {
        let alert = UIAlertController(title: "Вы успешно зарегестрировались", message: "Мы очень рады что вы присоеднились к нам!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: goToLoginController))
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToLoginController(alert: UIAlertAction!) {
        let loginController = LoginController()
        loginController.modalTransitionStyle = .crossDissolve
        self.present(loginController, animated: true, completion: nil)
    }
    
    @objc func havenotcode() {
        textLabel.text = "Мы повторно отправили код вам по СМС, укажите его ниже"
    }

}
