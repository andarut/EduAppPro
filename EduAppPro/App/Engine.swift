//
//  CustomView.swift
//  EduAppPro
//
//  Created by Andrey on 05/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class CustomView {
    
    let save = UserDefaults.standard
    
    var images = [UIImageView]()
    var textFields = [UITextField]()
    var buttons = [UIButton]()
    var labels = [UILabel]()
    var segmentedControls = [CustomSegmentedControl]()
    var views = [UIView]()
    
    var removeImages = [UIImageView]()
    var removeTextFields = [UITextField]()
    var removeButtons = [UIButton]()
    var view: UIView
    
    init(view: UIView) {
        self.view = view
    }

    func addImage(image: UIImageView) {
        let scaleX = Double(self.view.frame.width / 375)
        let scaleY = Double(self.view.frame.height / 812)
        save.set(scaleX, forKey: "scaleX")
        save.set(scaleY, forKey: "scaleY")
        save.set(self.view.frame.width, forKey: "width")
        image.frame = CGRect(x: Int(Double(image.frame.minX)*scaleX), y: Int(Double(image.frame.minY)*scaleY), width: Int(Double(image.frame.width)*scaleX), height: Int(Double(image.frame.height)*scaleX))
        
        
        self.images.append(image)
    }
    
    func addViewWithoutScaling(view: UIView) {
        views.append(view)
    }
    
    func addTextField(textField: UITextField) {
        let scaleX = Double(self.view.frame.width / 375)
        let scaleY = Double(self.view.frame.height / 812)
        
        let background = UIImageView()
        
        background.image = UIImage(named: "TextFieldBackground")
    
        if textFields.firstIndex(of: textField) == nil {
            background.frame = CGRect(x: Double(textField.frame.minX)*scaleX - Double(textField.frame.minX/4.5), y: Double(textField.frame.minY)*scaleY, width: Double(textField.frame.width)*scaleX + Double(textField.frame.width/14.25), height: Double(textField.frame.height)*scaleX)
            textField.frame = CGRect(x: Double(textField.frame.minX)*scaleX, y: Double(textField.frame.minY)*scaleY, width: Double(textField.frame.width)*scaleX, height: Double(textField.frame.height)*scaleX)
        } else {
            background.frame = CGRect(x: Double(textField.frame.minX) - Double(textField.frame.minX/4.5), y: Double(textField.frame.minY), width: Double(textField.frame.width) + Double(textField.frame.width/14.25), height: Double(textField.frame.height))
        }
        
        if let index = removeTextFields.firstIndex(of: textField) {
            removeTextFields.remove(at: index)
        }

        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: self.view.frame.width / 20)!
        ]
        
        textField.font = UIFont(name: "Roboto-Regular", size: self.view.frame.width / 20)!
        
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "nil", attributes:attributes)
        
        images.append(background)
        textFields.append(textField)
    }
    
    func changeTextFieldAlpha(newValue: Float, textField: UITextField) {
        let background = UIImageView(frame: CGRect(x: Double(textField.frame.minX) - Double(textField.frame.minX/4.5), y: Double(textField.frame.minY), width: Double(textField.frame.width) + Double(textField.frame.width/14.25), height: Double(textField.frame.height)))
        
        background.image = UIImage(named: "TextFieldBackground")
        
        for b in images {
            if b.frame.minY == background.frame.minY {
                b.alpha = CGFloat(newValue)
            }
        }
        
        textField.alpha = CGFloat(newValue)
    }
    
    func removeTextField(textField: UITextField) {
        
        let background = UIImageView(frame: CGRect(x: Double(textField.frame.minX) - Double(textField.frame.minX/4.5), y: Double(textField.frame.minY), width: Double(textField.frame.width) + Double(textField.frame.width/14.25), height: Double(textField.frame.height)))
        
        background.image = UIImage(named: "TextFieldBackground")

        for b in images {
            if b.frame.minY == background.frame.minY {
                removeImages.append(b)
            }
        }
        
        for t in textFields {
            if t.frame.minY == textField.frame.minY {
                removeTextFields.append(t)
                break
            }
        }
    }
    
    func removeButton(button: UIButton) {
        for b in buttons {      
            if b.frame.minY == button.frame.minY {
                removeButtons.append(b)
                break
            }
        }
    }
    
    
    func addButton(button: UIButton) {
        let scaleX = Double(self.view.frame.width / 375)
        let scaleY = Double(self.view.frame.height / 812)
        
        if buttons.firstIndex(of: button) == nil  {
            button.frame = CGRect(x: Double(button.frame.minX)*scaleX, y: Double(button.frame.minY)*scaleY, width: Double(button.frame.width)*scaleX, height: Double(button.frame.height)*scaleX)
        }
        
        if let index = removeButtons.firstIndex(of: button) {
            removeButtons.remove(at: index)
        }
        
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: self.view.frame.width / 20)
        
        buttons.append(button)
    }
    
    
    func addLabel(label: UILabel, type: LabelType) {
        let scaleX = Double(self.view.frame.width / 375)
        let scaleY = Double(self.view.frame.height / 812)
        label.frame = CGRect(x: Double(label.frame.minX)*scaleX, y: Double(label.frame.minY)*scaleY, width: Double(label.frame.width)*scaleX, height: Double(label.frame.height)*scaleX)
        if type == .big {
            label.font = UIFont(name: "Roboto-Medium", size: self.view.frame.width / 13)
            label.textColor = UIColor.UIColorFromRGB(rgbValue: 0x5E5E5E)
        } else if type == .small {
            label.font = UIFont(name: "Roboto-Regular", size: self.view.frame.width / 20)
        } else if type == .medium {
            label.font = UIFont(name: "Roboto-Regular", size: self.view.frame.width / 17)
        } else if type == .verySmall {
            label.font = UIFont(name: "Roboto-Regular", size: self.view.frame.width / 27)
        } else if type == .verySmallPlus {
            label.font = UIFont(name: "Roboto-Regular", size: self.view.frame.width / 29)
        } else if type == .grande {
            label.font = UIFont(name: "Roboto-Regular", size: self.view.frame.width / 9)
        }
        
        labels.append(label)
    }
    
    
    func animateTextField(textField: UITextField, animation: CABasicAnimation, keep: Bool) {
        
        let background = UIImageView(frame: CGRect(x: Double(textField.frame.minX) - Double(textField.frame.minX/4.5), y: Double(textField.frame.minY), width: Double(textField.frame.width) + Double(textField.frame.width/14.25), height: Double(textField.frame.height)))
        
        background.image = UIImage(named: "TextFieldBackground")
        
        
        
        for b in images {
            if b.frame.minY == background.frame.minY {
                b.layer.add(animation, forKey: animation.keyPath)
                if keep {
                    b.frame = CGRect(x: b.frame.minX, y: (animation.toValue as! CGPoint).y * CGFloat(save.double(forKey: "scaleY")), width: b.frame.width, height: b.frame.height)
                }
            }
        }

        textField.layer.add(animation, forKey: animation.keyPath)
        if keep {
            textField.frame = CGRect(x: textField.frame.minX, y: (animation.toValue as! CGPoint).y * CGFloat(save.double(forKey: "scaleY")), width: textField.frame.width, height: textField.frame.height)
        }
        
    }
    
    
    func addSegmentedControl(segmentedControl: CustomSegmentedControl) {
        let scaleX = Double(self.view.frame.width / 375)
        let scaleY = Double(self.view.frame.height / 812)
        segmentedControl.frame = CGRect(x: Double(segmentedControl.frame.minX)*scaleX, y: Double(segmentedControl.frame.minY)*scaleY, width: Double(segmentedControl.frame.width)*scaleX, height: Double(segmentedControl.frame.height)*scaleX)
        segmentedControl.borderColor = .clear
        segmentedControl.selectedLabelColor = UIColor.UIColorFromRGB(rgbValue: 0x1196D4)
        segmentedControl.unselectedLabelColor = UIColor.UIColorFromRGB(rgbValue: 0x5E5E5E)
        segmentedControl.backgroundColor = .clear
        segmentedControl.font = UIFont(name: "Roboto-Regular", size: self.view.frame.width / 20)!
        segmentedControl.thumbColor = .clear
        segmentedControl.selectedIndex = 0
        segmentedControls.append(segmentedControl)
    }
    
    func addView(view: UIView, lines: Bool) {
        let scaleX = Double(self.view.frame.width / 375)
        let scaleY = Double(self.view.frame.height / 812)
        
        if lines {
            let line = UIImageView(frame: CGRect(x: 0, y: 0, width: Double(view.frame.width)*scaleX, height: 1.5))
            line.image = UIImage(named: "Line")
            let line2 = UIImageView(frame: CGRect(x: 0.0, y: Double(view.frame.height), width: Double(view.frame.width)*scaleX, height: 1.5))
            line2.image = UIImage(named: "Line")
            view.addSubview(line)
            view.addSubview(line2)
        }
        
        view.frame = CGRect(x: Double(view.frame.minX)*scaleX, y: Double(view.frame.minY)*scaleY, width: Double(view.frame.width)*scaleX, height: Double(view.frame.height)*scaleX)
        
        views.append(view)
    }
    
    enum LabelType {
        case big, small, medium, verySmall, verySmallPlus, grande
    }
    
    func show() {
        for i in images {
            if i.alpha > 0.7 || i.alpha == 0 {
                i.alpha = 1
            }
            
            self.view.addSubview(i)
        }
        for i in textFields {
            if i.alpha > 0.7 || i.alpha == 0 {
                i.alpha = 1
            }
            self.view.addSubview(i)
        }
        for i in buttons {
            i.alpha = 1
            self.view.addSubview(i)
        }
        for i in labels {
            i.alpha = 1
            self.view.addSubview(i)
        }
        for i in segmentedControls {
            i.alpha = 1
            self.view.addSubview(i)
        }
        for i in views {
            i.alpha = 1
            self.view.addSubview(i)
        }
        for i in removeTextFields {
            i.alpha = 0
        }
        for i in removeImages {
            i.alpha = 0
        }
        for i in removeButtons {
            i.alpha = 0
        }
    }
}
