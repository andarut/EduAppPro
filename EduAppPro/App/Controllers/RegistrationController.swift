//
//  RegistrationController.swift
//  EduAppPro
//
//  Created by Andrey on 06/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {

    let returnToEntryButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 45, y: 44.6, width: 53.7, height: 13.6))
        button.setTitleColor(UIColor.UIColorFromRGB(rgbValue: 0x1196D4), for: .normal)
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(returnToEntry), for: .touchDown)
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
    
    let segmentedControl: CustomSegmentedControl = {
        let segmentedControl = CustomSegmentedControl(frame: CGRect(x: 65.2, y: 186.6, width: 244.7, height: 30.7))
        segmentedControl.items = ["Очно", "Онлайн"]
        return segmentedControl
    }()
    
    let segmentedControlBackground: UIImageView = {
        let background = UIImageView(frame: CGRect(x: 65.2, y: 186.6, width: 244.7, height: 30.7))
        background.image = UIImage(named: "SegmentedBackground")
        return background
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 290.2, width: 285.7, height: 46))
        textField.placeholder = " " + "Имя"
        return textField
    }()
    
    let lastnameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 344.6, width: 285.7, height: 46))
        textField.placeholder = " " + "Фамилия"
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 398.9, width: 285.7, height: 46))
        textField.placeholder = " " + "Email"
        textField.keyboardType = UIKeyboardType.emailAddress
        return textField
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 44.7, y: 453.2, width: 285.7, height: 46))
        textField.placeholder = " " + "Телефон"
        textField.keyboardType = UIKeyboardType.phonePad
        return textField
    }()
    
    let registrationButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 34.7, y: 525.2, width: 305.7, height: 46))
        button.setTitle(" " + "Регистрация", for: .normal)
        button.setBackgroundImage(UIImage(named: "GreenButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(registration), for: .touchDown)
        return button
    }()
    
    let googleButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 44.7, y: 592.2, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "Google_icon"), for: .normal)
        return button
    }()
    
    let vkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 120.7, y: 592.2, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "Vk_icon"), for: .normal)
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 200.7, y: 592.2, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "Facebook_icon"), for: .normal)
        return button
    }()
    
    let githubButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 280.7, y: 592.2, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "Github_icon"), for: .normal)
        return button
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        let view = CustomView(view: self.view)
        view.addButton(button: returnToEntryButton)
        view.addImage(image: pointer)
        view.addLabel(label: label, type: .big)
        view.addSegmentedControl(segmentedControl: segmentedControl)
        view.addImage(image: segmentedControlBackground)
        view.addTextField(textField: nameTextField)
        view.addTextField(textField: lastnameTextField)
        view.addTextField(textField: emailTextField)
        view.addTextField(textField: phoneTextField)
        view.addButton(button: googleButton)
        view.addButton(button: vkButton)
        view.addButton(button: facebookButton)
        view.addButton(button: githubButton)
        view.addButton(button: registrationButton)
        view.show()
    }
    
    @objc func returnToEntry() {
        let loginController = LoginController()
        loginController.modalTransitionStyle = .crossDissolve
        self.present(loginController, animated: true, completion: nil)
    }
    
    @objc func registration() {
        let confirmationOfRegistrationController = ConfirmationOfRegistrationController()
        confirmationOfRegistrationController.modalTransitionStyle = .crossDissolve
        self.present(confirmationOfRegistrationController, animated: true, completion: nil)
    }
    
}
