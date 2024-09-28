//
//  ProfileController.swift
//  EduAppPro
//
//  Created by Andrey on 16/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    var returnScreenName = ""
    
    let save = UserDefaults.standard
    
    var customView = CustomView(view: UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)))
    
    let pointer: UIImageView = {
        let pointer = UIImageView(frame: CGRect(x: 29, y: 45.4, width: 6.9, height: 12.1))
        pointer.image = UIImage(named: "Pointer")
        return pointer
    }()
    
    let returnToButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 44.7, y: 44.8, width: 110, height: 13.4))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.addTarget(self, action: #selector(returnTo), for: .touchDown)
        button.setTitle("Вход", for: .normal)
        return button
    }()
    
    let exitButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 278, y: 44.8, width: 60, height: 13.4))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0xD51717), for: .normal)
        button.setTitle("Выйти", for: .normal)
        button.addTarget(self, action: #selector(exit), for: .touchDown)
        return button
    }()
    
    let avaImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 44.5, y: 92.7, width: 142.8, height: 142.8))
        imageView.image = UIImage(named: "test_ava")
        return imageView
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 46.2, y: 261.5, width: 100, height: 15))
        label.text = "@login_hipstera"
        label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x8C8C8C)
        return label
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 45.4, y: 270.7, width: 144.4, height: 80))
        label.text = """
        Какой-то
        Хипстер
        """
        label.numberOfLines = 0
        return label
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 360.3, width: 285.7, height: 46))
        textField.placeholder = "Пароль"
        textField.text = "*******"
        textField.addTarget(self, action: #selector(changePassword), for: .touchDown)
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 414.7, width: 285.7, height: 46))
        textField.placeholder = "Email"
        textField.text = "stalin@sssr.ru"
        textField.addTarget(self, action: #selector(changeEmail), for: .touchDown)
        return textField
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 469, width: 285, height: 46))
        textField.placeholder = "Номер"
        textField.isUserInteractionEnabled = false
        textField.text = "+79166287037"
        return textField
    }()
    
    let updatePasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 34.7, y: 560, width: 305.7, height: 46))
        button.setBackgroundImage(UIImage(named: "BlueButtonBackground"), for: .normal)
        button.setTitle("Обновить", for: .normal)
        return button
    }()

    let oldPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 380.3, width: 285.7, height: 46))
        textField.placeholder = "Старый пароль"
        return textField
    }()
    
    let newPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 443, width: 285.7, height: 46))
        textField.placeholder = "Новый пароль"
        return textField
    }()
    
    let replayPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 497.3, width: 285.7, height: 46))
        textField.placeholder = "Повтор нового пароля"
        return textField
    }()
    
    let updateEmailButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 34.7, y: 496.7, width: 305.7, height: 46))
        button.setBackgroundImage(UIImage(named: "BlueButtonBackground"), for: .normal)
        button.setTitle("Запросить подтверждение", for: .normal)
        return button
    }()
    
    let newEmailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 431.3, width: 285.7, height: 46))
        textField.placeholder = "Новая почта"
        return textField
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        returnToButton.setTitle(self.returnScreenName, for: .normal)
        if returnScreenName == "Главная" {
            self.returnToButton.frame = CGRect(x: self.returnToButton.frame.minX, y: self.returnToButton.frame.minY, width: 75, height: self.returnToButton.frame.height)
        } else if returnScreenName == "Обсуждения" {
            self.returnToButton.frame = CGRect(x: self.returnToButton.frame.minX, y: self.returnToButton.frame.minY, width: 110, height: self.returnToButton.frame.height)
        } else if returnScreenName == "Занятия" {
            self.returnToButton.frame = CGRect(x: self.returnToButton.frame.minX, y: self.returnToButton.frame.minY, width: 75, height: self.returnToButton.frame.height)
        } else if returnScreenName == "Курсы" {
            self.returnToButton.frame = CGRect(x: self.returnToButton.frame.minX, y: self.returnToButton.frame.minY, width: 75, height: self.returnToButton.frame.height)
        } else if returnScreenName == "Оценки" {
            self.returnToButton.frame = CGRect(x: self.returnToButton.frame.minX, y: self.returnToButton.frame.minY, width: 75, height: self.returnToButton.frame.height)
        } else if returnScreenName == "Финансы" {
            self.returnToButton.frame = CGRect(x: self.returnToButton.frame.minX, y: self.returnToButton.frame.minY, width: 100, height: self.returnToButton.frame.height)
        } else if returnScreenName == "Достижения" {
            self.returnToButton.frame = CGRect(x: self.returnToButton.frame.minX, y: self.returnToButton.frame.minY, width: 130, height: self.returnToButton.frame.height)
        }
        

        customView = CustomView(view: self.view)
        customView.addImage(image: pointer)
        customView.addButton(button: returnToButton)
        customView.addButton(button: exitButton)
        customView.addImage(image: avaImageView)
        customView.addLabel(label: loginLabel, type: .verySmall)
        customView.addLabel(label: label, type: .big)
        customView.addTextField(textField: passwordTextField)
        customView.addTextField(textField: emailTextField)
        customView.addTextField(textField: phoneTextField)
        customView.show()

        
    }
    
    @objc func returnTo() {
        if returnScreenName == "Главная" && returnToButton.titleLabel?.text != "Отменить" {
            let mainController = MainController()
            mainController.modalTransitionStyle = .crossDissolve
            self.present(mainController, animated: true, completion: nil)
        } else if returnScreenName == "Обсуждения" && returnToButton.titleLabel?.text != "Отменить" {
            let discussionController = DiscussionController()
            discussionController.modalTransitionStyle = .crossDissolve
            self.present(discussionController, animated: true, completion: nil)
        } else if returnScreenName == "Занятия" && returnToButton.titleLabel?.text != "Отменить" {
            let classesController = ClassesController()
            classesController.modalTransitionStyle = .crossDissolve
            self.present(classesController, animated: true, completion: nil)
        } else if returnScreenName == "Курсы" && returnToButton.titleLabel?.text != "Отменить" {
            let coursesController = CoursesController()
            coursesController.modalTransitionStyle = .crossDissolve
            self.present(coursesController, animated: true, completion: nil)
        } else if returnScreenName == "Оценки" && returnToButton.titleLabel?.text != "Отменить" {
            let performanceController = PerformanceController()
            performanceController.modalTransitionStyle = .crossDissolve
            self.present(performanceController, animated: true, completion: nil)
        } else if returnScreenName == "Финансы" && returnToButton.titleLabel?.text != "Отменить" {
            let financeController = FinanceController()
            financeController.modalTransitionStyle = .crossDissolve
            self.present(financeController, animated: true, completion: nil)
        } else if returnScreenName == "Достижения" && returnToButton.titleLabel?.text != "Отменить" {
            let progressController = ProgressController()
            progressController.modalTransitionStyle = .crossDissolve
            self.present(progressController, animated: true, completion: nil)
        }
    }
    
    @objc func exit() {
        let loginController = LoginController()
        loginController.modalTransitionStyle = .crossDissolve
        self.present(loginController, animated: true, completion: nil)
    }
    
    @objc func changePassword() {
        returnToButton.setTitle("Отменить", for: .normal)
        returnToButton.frame = CGRect(x: returnToButton.frame.minX, y: returnToButton.frame.minY, width: 90, height: returnToButton.frame.height)
        returnToButton.addTarget(self, action: #selector(cancelChangePassword), for: .touchDown)
        customView.removeTextField(textField: passwordTextField)
        
        let emailAnimation = CABasicAnimation(keyPath: "position")
        emailAnimation.duration = 0.5
        emailAnimation.speed = 3
        emailAnimation.repeatCount = 0
        emailAnimation.fromValue = CGPoint(x: emailTextField.center.x, y: emailTextField.frame.minY)
        emailAnimation.toValue = CGPoint(x: emailTextField.center.x, y: 620.7)
        emailTextField.isUserInteractionEnabled = false
        customView.animateTextField(textField: emailTextField, animation: emailAnimation, keep: true)
        customView.changeTextFieldAlpha(newValue: 0.3, textField: emailTextField)
        
        let phoneAnimation = CABasicAnimation(keyPath: "position")
        phoneAnimation.duration = 0.5
        phoneAnimation.speed = 3
        phoneAnimation.repeatCount = 0
        phoneAnimation.fromValue = CGPoint(x: phoneTextField.center.x, y: phoneTextField.frame.minY)
        phoneAnimation.toValue = CGPoint(x: phoneTextField.center.x, y: 679)
        phoneTextField.isUserInteractionEnabled = false
        customView.animateTextField(textField: phoneTextField, animation: phoneAnimation, keep: true)
        customView.changeTextFieldAlpha(newValue: 0.3, textField: phoneTextField)
        
        customView.addTextField(textField: oldPasswordTextField)
        customView.addTextField(textField: newPasswordTextField)
        customView.addTextField(textField: replayPasswordTextField)
        customView.addButton(button: updatePasswordButton)
        customView.show()
    }
    
    @objc func cancelChangePassword() {
        returnToButton.setTitle(returnScreenName, for: .normal)
        returnToButton.addTarget(self, action: #selector(returnTo), for: .touchDown)
        returnToButton.removeTarget(self, action: #selector(changePassword), for: .touchDown)
        customView.addTextField(textField: passwordTextField)
        let emailAnimation = CABasicAnimation(keyPath: "position")
        emailAnimation.duration = 0.5
        emailAnimation.speed = 3
        emailAnimation.repeatCount = 0
        emailAnimation.fromValue = CGPoint(x: emailTextField.center.x, y: emailTextField.frame.minY)
        emailAnimation.toValue = CGPoint(x: emailTextField.center.x, y: 414)
        emailTextField.isUserInteractionEnabled = true
        customView.animateTextField(textField: emailTextField, animation: emailAnimation, keep: true)
        customView.changeTextFieldAlpha(newValue: 1, textField: emailTextField)
        
        let phoneAnimation = CABasicAnimation(keyPath: "position")
        phoneAnimation.duration = 0.5
        phoneAnimation.speed = 3
        phoneAnimation.repeatCount = 0
        phoneAnimation.fromValue = CGPoint(x: phoneTextField.center.x, y: phoneTextField.frame.minY)
        phoneAnimation.toValue = CGPoint(x: phoneTextField.center.x, y: 469)
        phoneTextField.isUserInteractionEnabled = true
        customView.animateTextField(textField: phoneTextField, animation: phoneAnimation, keep: true)
        customView.changeTextFieldAlpha(newValue: 1, textField: phoneTextField)
        
        customView.removeTextField(textField: oldPasswordTextField)
        customView.removeTextField(textField: newPasswordTextField)
        customView.removeTextField(textField: replayPasswordTextField)
        customView.removeButton(button: updatePasswordButton)
        customView.show()
    }
    
    @objc func changeEmail() {
        returnToButton.setTitle("Отменить", for: .normal)
        returnToButton.frame = CGRect(x: returnToButton.frame.minX, y: returnToButton.frame.minY, width: 90, height: returnToButton.frame.height)
        returnToButton.addTarget(self, action: #selector(cancelChangeEmail), for: .touchDown)
        customView.removeTextField(textField: emailTextField)
        self.newEmailTextField.keyboardType = UIKeyboardType.emailAddress
        let phoneAnimation = CABasicAnimation(keyPath: "position")
        phoneAnimation.duration = 0.5
        phoneAnimation.speed = 3
        phoneAnimation.repeatCount = 0
        phoneAnimation.fromValue = CGPoint(x: phoneTextField.center.x, y: phoneTextField.frame.minY)
        phoneAnimation.toValue = CGPoint(x: phoneTextField.center.x, y: 556.8)
        phoneTextField.isUserInteractionEnabled = false
        customView.animateTextField(textField: phoneTextField, animation: phoneAnimation, keep: true)
        customView.changeTextFieldAlpha(newValue: 0.3, textField: phoneTextField)
        customView.changeTextFieldAlpha(newValue: 0.3, textField: passwordTextField)
        
        customView.addTextField(textField: newEmailTextField)
        customView.addButton(button: updateEmailButton)
        customView.show()
    }
    
    @objc func cancelChangeEmail() {
        returnToButton.setTitle(returnScreenName, for: .normal)
        returnToButton.addTarget(self, action: #selector(returnTo), for: .touchDown)
        customView.addTextField(textField: emailTextField)
        returnToButton.removeTarget(self, action: #selector(changeEmail), for: .touchDown)
        
        let phoneAnimation = CABasicAnimation(keyPath: "position")
        phoneAnimation.duration = 0.5
        phoneAnimation.speed = 3
        phoneAnimation.repeatCount = 0
        phoneAnimation.fromValue = CGPoint(x: phoneTextField.center.x, y: phoneTextField.frame.minY)
        phoneAnimation.toValue = CGPoint(x: phoneTextField.center.x, y: 469)
        phoneTextField.isUserInteractionEnabled = false
        customView.animateTextField(textField: phoneTextField, animation: phoneAnimation, keep: true)
        customView.changeTextFieldAlpha(newValue: 1, textField: phoneTextField)
        customView.changeTextFieldAlpha(newValue: 1, textField: passwordTextField)
        
        customView.removeTextField(textField: newEmailTextField)
        customView.removeButton(button: updateEmailButton)
        customView.show()
    }
    
}
