//
//  LoginController.swift
//  EduAppPro
//
//  Created by Andrey on 05/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    let logoImageView: UIImageView = {
        let image = UIImage(named: "WhiteLogo")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 130, y: 191, width: 115, height: 55)
        return imageView
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 302, width: 285.7, height: 46))
        textField.placeholder = " " + "Логин"
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 356.3, width: 285.7, height: 46))
        textField.placeholder = " " + "Пароль"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 35.7, y: 427.3, width: 305.7, height: 46))
        button.setTitle("Войти", for: .normal)
        button.setBackgroundImage(UIImage(named: "BlueButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchDown)
        return button
    }()
    
    let registrationButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 35.7, y: 721.3, width: 305.7, height: 46))
        button.setTitle("Регистрация", for: .normal)
        button.setBackgroundImage(UIImage(named: "GreenButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(registration), for: .touchDown)
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 37, y: 502.3, width: 145, height: 17.9))
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.addTarget(self, action: #selector(forgotPassword), for: .touchDown)
        return button
    }()
    
    let googleButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 44.7, y: 544.8, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "Google_icon"), for: .normal)
        return button
    }()
    
    let vkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 120.7, y: 544.8, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "Vk_icon"), for: .normal)
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 200.7, y: 544.8, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "Facebook_icon"), for: .normal)
        return button
    }()
    
    let githubButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 280.7, y: 544.8, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "Github_icon"), for: .normal)
        return button
    }()
    
    var customView = CustomView(view: UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        customView = CustomView(view: self.view)
        customView.addImage(image: logoImageView)
        customView.addTextField(textField: loginTextField)
        customView.addTextField(textField: passwordTextField)
        customView.addButton(button: forgotPasswordButton)
        customView.addButton(button: registrationButton)
        customView.addButton(button: loginButton)
        customView.addButton(button: googleButton)
        customView.addButton(button: vkButton)
        customView.addButton(button: facebookButton)
        customView.addButton(button: githubButton)
        customView.show()
    }
 
    @objc func registration() {
        let registrationController = RegistrationController()
        registrationController.modalTransitionStyle = .crossDissolve
        self.present(registrationController, animated: true, completion: nil)
    }
    
    @objc func login() {
        if loginTextField.text == "" && passwordTextField.text == "" {
            let mainController = MainController()
            mainController.modalTransitionStyle = .crossDissolve
            self.present(mainController, animated: true, completion: nil)
        } else {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.1
            animation.repeatCount = 1
            animation.autoreverses = true
            animation.fromValue = CGPoint(x: loginTextField.center.x - 20, y: loginTextField.center.y)
            animation.toValue = CGPoint(x: loginTextField.center.x + 20, y: loginTextField.center.y)
            customView.animateTextField(textField: loginTextField, animation: animation, keep: false)
        }
    }
    
    @objc func forgotPassword() {
        let passwordRecoveryController = PasswordRecoveryController()
        passwordRecoveryController.modalTransitionStyle = .crossDissolve
        self.present(passwordRecoveryController, animated: true, completion: nil)
    }
    
}






