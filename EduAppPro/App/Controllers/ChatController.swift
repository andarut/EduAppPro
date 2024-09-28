//
//  ChatController.swift
//  EduAppPro
//
//  Created by Andrey on 24/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit
import MessengerKit
import VACalendar

class ChatController: MSGMessengerViewController {
    
    var name = ""
    
    var youNamed = false
    
    let me = User(displayName: "Steve", avatar: UIImage(named: "my_ava"), avatarUrl: nil, isSender: true)
    
    let notMe = User(displayName: "Tim", avatar: UIImage(named: "danil_ava"), avatarUrl: nil, isSender: false)
    
    var id = 100
    
    
    let pointer: UIImageView = {
        let pointer = UIImageView(frame: CGRect(x: 29, y: 45.4, width: 6.9, height: 12.1))
        pointer.image = UIImage(named: "Pointer")
        return pointer
    }()
    
    
    override var style: MSGMessengerStyle {
        var style = MessengerKit.Styles.iMessage
        style.headerHeight = 0
        style.inputPlaceholder = "Сообщение..."
        style.alwaysDisplayTails = true
        style.outgoingBubbleColor = UIColor.UIColorFromRGB(rgbValue: 0x1196D4)
        style.outgoingTextColor = .white
        style.incomingBubbleColor = UIColor.UIColorFromRGB(rgbValue: 0x27AE60)
        return style
    }
    
    lazy var messages: [[MSGMessage]] = {
        return [
            [
                MSGMessage(id: 2, body: .text("Где проект?!"), user: notMe, sentAt: Date()),
            ],
            [
                MSGMessage(id: 1, body: .text("Ещё парочку багов. Дайте время, пожалуйста!"), user: me, sentAt: Date()),
            ],
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(back))
        leftSwipe.direction = .right
        view.addGestureRecognizer(leftSwipe)
        title = "iMessage"
        
        dataSource = self
        delegate = self
    }
    
    @objc func back(sender: UISwipeGestureRecognizer) {
        let discussionController = DiscussionController()
        discussionController.modalTransitionStyle = .crossDissolve
        self.present(discussionController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.scrollToBottom(animated: false)
    }
    
    override func inputViewPrimaryActionTriggered(inputView: MSGInputView) {
        id += 1
        
        let body: MSGMessageBody = (inputView.message.containsOnlyEmoji && inputView.message.count < 5) ? .emoji(inputView.message) : .text(inputView.message)
        
        let message = MSGMessage(id: id, body: body, user: me, sentAt: Date())
        insert(message)
    }
    
    override func insert(_ message: MSGMessage) {
        
        collectionView.performBatchUpdates({
            if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                self.messages[self.messages.count - 1].append(message)
                
                let sectionIndex = self.messages.count - 1
                let itemIndex = self.messages[sectionIndex].count - 1
                self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                
            } else {
                self.messages.append([message])
                let sectionIndex = self.messages.count - 1
                self.collectionView.insertSections([sectionIndex])
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: true)
            self.collectionView.layoutTypingLabelIfNeeded()
        })
        
    }
    
    override func insert(_ messages: [MSGMessage], callback: (() -> Void)? = nil) {
        
        collectionView.performBatchUpdates({
            for message in messages {
                if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                    self.messages[self.messages.count - 1].append(message)
                    
                    let sectionIndex = self.messages.count - 1
                    let itemIndex = self.messages[sectionIndex].count - 1
                    self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                    
                } else {
                    self.messages.append([message])
                    let sectionIndex = self.messages.count - 1
                    self.collectionView.insertSections([sectionIndex])
                }
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: false)
            self.collectionView.layoutTypingLabelIfNeeded()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                callback?()
            }
        })
        
    }
    
}


