//
//  DiscussionController.swift
//  EduAppPro
//
//  Created by Andrey on 20/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class DiscussionController: UIViewController {

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
        let label = UILabel(frame: CGRect(x: 43.6, y: 122.5, width: 190, height: 29.2))
        label.text = "Обсуждения"
        return label
    }()
    
    let addDiscussionButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 270.7, y: 707.7, width: 59.7, height: 59.7))
        button.setBackgroundImage(UIImage(named: "addDuscussionButtonBackground"), for: .normal)
        button.addTarget(self, action: #selector(addDiscussion), for: .touchDown)
        return button
    }()
    
    let discussionView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discussionView.frame = CGRect(x: 0, y: 165.4, width: 375, height: 193.5)
        discussionView.backgroundColor = .white
        let content1 = CustomDiscussionCell(frame: CGRect(x: 0, y: 0, width: 375, height: 64))
        content1.configure(with: CustomDiscussionCellModel(mainText: "Рахов Александр", smallText: "Некое недавнее сообщение...", image: "test_ava_2"))
        content1.input = self
        let content2 = CustomDiscussionCell(frame: CGRect(x: 0, y: content1.frame.minY + content1.frame.height, width: 375, height: 64))
        content2.configure(with: CustomDiscussionCellModel(mainText: "Другой, но не демон", smallText: "Некое недавнее сообщение...", image: "test_ava_2"))
        content2.input = self
        let content3 = CustomDiscussionCell(frame: CGRect(x: 0, y: content2.frame.minY + content2.frame.height, width: 375, height: 64))
        content3.configure(with: CustomDiscussionCellModel(mainText: "НЕ ДЕМОН", smallText: "Некое недавнее сообщение...", image: "test_ava_2"))
        content3.input = self
        discussionView.addSubview(content1)
        discussionView.addSubview(content2)
        discussionView.addSubview(content3)
        
        let height = (content1.frame.height + content2.frame.height + content3.frame.height)
        discussionView.frame = CGRect(x: discussionView.frame.minX, y: discussionView.frame.minY, width: discussionView.frame.width, height: height)
        
        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xF4F6FA)
        let src = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        src.showsVerticalScrollIndicator = false
        let view = CustomView(view: src)
        view.addButton(button: menuButton)
        view.addButton(button: profileButton)
        view.addLabel(label: label, type: .big)
        view.addView(view: discussionView, lines: true)
        view.addButton(button: addDiscussionButton)
        view.show()
        setup()
        src.contentSize = CGSize(width: src.contentSize.width, height: (self.view.frame.height) * 1.1)
        self.view.addSubview(src)
    }
    
    func setup() {
        self.discussionView.frame = CGRect(x: self.discussionView.frame.minX, y: self.discussionView.frame.minY, width: self.discussionView.frame.width, height: self.discussionView.frame.height / CGFloat(save.double(forKey: "scaleX")))
    }
    
    @objc func menu() {
        let menu = MenuController()
        menu.modalTransitionStyle = .crossDissolve
        menu.input = "Discussion"
        menu.discussionControllerCell.setSelected(selected: true)
        self.present(menu, animated: true, completion: nil)
    }
    
    @objc func profile() {
        let profileController = ProfileController()
        profileController.returnScreenName = "Обсуждения"
        profileController.modalTransitionStyle = .crossDissolve
        self.present(profileController, animated: true, completion: nil)
    }
    
    @objc func addDiscussion() {
        print("addDiscussion")
        let newDiscussionController = NewDiscussionController()
        newDiscussionController.modalTransitionStyle = .crossDissolve
        self.present(newDiscussionController, animated: true, completion: nil)
    }
    

 

}
