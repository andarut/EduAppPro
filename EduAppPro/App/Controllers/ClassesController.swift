//
//  ClassesController.swift
//  EduAppPro
//
//  Created by Andrey on 20/07/2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit
import VACalendar

class ClassesController: UIViewController {
    
    let save = UserDefaults.standard
    
    var name = "Classes"
    
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
        let label = UILabel(frame: CGRect(x: 44.4, y: 123.5, width: 120, height: 22.4))
        label.text = "Занятия"
        return label
    }()
    
    let NearestСlassesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.6, y: 170.5, width: 214.1, height: 16.5))
        label.text = "Ближайшие занятия"
        return label
    }()
    
    let NearestСlassesView = UIView()
        
    
    let classCalendarLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 44.8, y: 440.5, width: 204.1, height: 20.9))
        label.text = "Календарь занятий"
        return label
    }()
    
    var monthHeaderView = VAMonthHeaderView(frame: CGRect(x: 0, y: 470, width: 375, height: 50))

    
    var weekDaysView = VAWeekDaysView(frame: CGRect(x: 0, y: 520, width: 375, height: 50))

    
    let defaultCalendar: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }()
    
    
    
    var calendarView: VACalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL YYYY"
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        var i = 0
        while i != dateFormatter.standaloneMonthSymbols.count {
            dateFormatter.standaloneMonthSymbols[i].capitalizeFirstLetter()
            i += 1
        }
       
        let appereance = VAMonthHeaderViewAppearance(
            previousButtonImage: UIImage(named: "previous")!,
            nextButtonImage: UIImage(named: "next")!,
            dateFormatter: dateFormatter
        )
        
        monthHeaderView.delegate = self
        monthHeaderView.appearance = appereance
        
        weekDaysView.appearance = VAWeekDaysViewAppearance(symbolsType: .veryShort, calendar: defaultCalendar)
        
        let calendar = VACalendar(calendar: defaultCalendar)
        calendarView = VACalendarView(frame: .zero, calendar: calendar)
        calendarView.showDaysOut = true
        calendarView.selectionStyle = .multi
        calendarView.monthDelegate = monthHeaderView
        calendarView.dayViewAppearanceDelegate = self
        calendarView.monthViewAppearanceDelegate = self
        calendarView.calendarDelegate = self
        calendarView.scrollDirection = .horizontal
        calendarView.setSupplementaries([])
        
        NearestСlassesView.frame = CGRect(x: 0, y: 195.4, width: 375, height: 210)
        NearestСlassesView.backgroundColor = .white
        let content1 = CustomClassesCell(frame: CGRect(x: 0, y: 0, width: 375, height: 50))
        content1.configure(with: CustomClassesCellModel(smallText: "10 октября, 17:10 – 18:40", mainText: "Дискретная математика", haveEvaluation: false, haveClasswork: false, haveHomework: false, textClip: false, selectedText: ""))
        content1.input = self
        let content2 = CustomClassesCell(frame: CGRect(x: 0, y: Int(content1.frame.minY + 50), width: 375, height: 100))
        content2.configure(with: CustomClassesCellModel(smallText: "12 октября, 17:10 – 18:40", mainText: "Программирование на C#", haveEvaluation: false, haveClasswork: true, haveHomework: true, textClip: false, selectedText: ""))
        content2.input = self
        let content3 = CustomClassesCell(frame: CGRect(x: 0, y: Int(content2.frame.minY + 100), width: 375, height: 75))
        content3.configure(with: CustomClassesCellModel(smallText: "15 октября, 17:10 – 18:40", mainText: "Программирование на C#", haveEvaluation: false, haveClasswork: false, haveHomework: true, textClip: false, selectedText: ""))
        content3.input = self
        NearestСlassesView.addSubview(content1)
        NearestСlassesView.addSubview(content2)
        NearestСlassesView.addSubview(content3)
        let height = (content1.frame.height + content2.frame.height + content3.frame.height)
        NearestСlassesView.frame = CGRect(x: NearestСlassesView.frame.minX, y: NearestСlassesView.frame.minY, width: NearestСlassesView.frame.width, height: height)
        self.view.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xF4F6FA)
        let src = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        src.showsVerticalScrollIndicator = false
        let customView = CustomView(view: src)
        customView.addButton(button: menuButton)
        customView.addView(view: weekDaysView, lines: false)
        calendarView.frame = CGRect(x: 0, y: 560, width: 375, height: view.frame.height * 0.25)
        calendarView.setup()
        
        customView.addView(view: monthHeaderView, lines: false)
        customView.addViewWithoutScaling(view: calendarView)
        customView.addButton(button: profileButton)
        customView.addLabel(label: label, type: .big)
        customView.addLabel(label: NearestСlassesLabel, type: .medium)
        customView.addView(view: NearestСlassesView, lines: true)
        customView.addLabel(label: classCalendarLabel, type: .medium)
        customView.show()
        setup()
        src.contentSize = CGSize(width: src.contentSize.width, height: (calendarView.frame.height + calendarView.frame.minY) * 1.1)
        self.view.addSubview(src)
    }

    func setup() {
        NearestСlassesView.frame = CGRect(x: NearestСlassesView.frame.minX, y: NearestСlassesLabel.frame.minY + 24.9, width: NearestСlassesView.frame.width, height: NearestСlassesView.frame.height / CGFloat(save.double(forKey: "scaleX")))
        classCalendarLabel.frame = CGRect(x: classCalendarLabel.frame.minX, y: NearestСlassesView.frame.minY + NearestСlassesView.frame.height + 13.8, width: classCalendarLabel.frame.width, height: classCalendarLabel.frame.height)
        monthHeaderView.frame = CGRect(x: monthHeaderView.frame.minX, y: classCalendarLabel.frame.minY + classCalendarLabel.frame.height + 10, width: monthHeaderView.frame.width, height: monthHeaderView.frame.height)
        weekDaysView.frame = CGRect(x: weekDaysView.frame.minX, y: monthHeaderView.frame.minY + monthHeaderView.frame.height, width: weekDaysView.frame.width, height: weekDaysView.frame.height)
        calendarView.frame = CGRect(x: calendarView.frame.minX, y: weekDaysView.frame.minY + weekDaysView.frame.height, width: calendarView.frame.width, height: calendarView.frame.height)

        
    }
    
    @objc func menu() {
        let menu = MenuController()
        menu.modalTransitionStyle = .crossDissolve
        menu.input = "Classes"
        menu.classesControllerCell.setSelected(selected: true)
        self.present(menu, animated: true, completion: nil)
    }
    
    @objc func profile() {
        let profileController = ProfileController()
        profileController.returnScreenName = "Занятия"
        profileController.modalTransitionStyle = .crossDissolve
        self.present(profileController, animated: true, completion: nil)
    }
    

}
