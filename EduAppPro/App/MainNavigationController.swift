//
//  MainNavigationController.swift
//  EduAppPro
//
//  Created by Andrey on 05/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        
    }
    
    @objc func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: false, completion: {
            
        })
    }
    
}
