//
//  DailyEntryTableViewCell.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/21/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

enum CellType: Int {
    
    case feel = 0
    case hydration = 1
    case sleep = 2
    case eat = 3
    case products = 4
    
    var description: String {
        switch self {
        case .feel: return "How do you feel today?"
        case .hydration: return "How many glasses of water did you drink today?"
        case .sleep: return "How many hours did you sleep last night?"
        case .eat: return "What did you eat mainly today?"
        case .products: return "What products did you use today?"
        }
    }
}

class DailyEntryTableViewCell: UITableViewCell {
    
    private var questionType: CellType = .feel
    private let questionLabel = UILabel()
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, index: Int) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupQuestionType(index)
        setupQuestionLabel()
        setupButtons()
    }
    
    func setupQuestionType(_ index: Int) {
        questionType = CellType(rawValue: index)!
    }
    
    func setupQuestionLabel() {
        questionLabel.text = questionType.description
        questionLabel.lineBreakMode = .byWordWrapping
        questionLabel.numberOfLines = 2
        questionLabel.font = SDFont(type: .mediumBlack, size: .mediumLarger).instance
            
        addSubview(questionLabel)
        questionLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(10)
//            make.height.equalTo(50)
        }
    }
    
    func setupButtons() {
        switch questionType {
        case .feel:
            setupFiveButtons(imageArr: ["excited", "happy", "meh",  "sad", "stressed"], imageDescrArr: ["Excited", "Happy", "Meh",  "Sad", "Stressed"])
            break
        case .hydration:
            setupFiveButtons(imageArr: ["2Cups", "34Cups","56Cups","78Cups","8Cups"], imageDescrArr: ["<2 Cups", "3-4 Cups","5-6 Cups","7-8 Cups",">8 Cups"])
            break
        case .sleep:
            setupFiveButtons(imageArr: ["2Hours","34Hours","56Hours","78Hours","8Hours"], imageDescrArr: ["<2 Hours", "3-4 Hours","5-6 Hours","7-8 Hours",">8 Hours"])
            break
        case .eat:
            setupSixButtons(imageDescArr: ["dairy", "fish2", "meat",  "refinedCarbs", "sugar", "vegetablesFruit"])
            break
        case .products:
            setupSixButtons(imageDescArr: ["Clinique-Green", "Clinique-Offwhite", "Clinique-Pink",  "Clinique-Turquouise", "Clinique-White", "Clinique-Yellow"])
            break
        }
        

    }
    func setupFiveButtons(imageArr: [String], imageDescrArr: [String]) {

        let imageGap = 25.0

        var buttonArray: [UIButton] = []

        for i in 0...4 {
            let button = UIButton()
            button.setImage(UIImage(named: imageArr[i]), for: .normal)
            button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            
            let buttonLabel = UILabel()
            buttonLabel.text = imageDescrArr[i]
            buttonLabel.font = SDFont(type: .medium, size: .mediumSmall).instance
            buttonLabel.textAlignment = .center
            buttonLabel.textColor = .gray
            
            buttonArray.append(button)
            addSubview(button)
            addSubview(buttonLabel)

            if (i == 0) {
                button.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(20)
                    make.width.equalTo(45)
                    make.height.equalTo(45)
                    make.top.equalTo(questionLabel.snp.bottom).offset(30)
                }
            } else {
                button.snp.makeConstraints { (make) in
                    make.left.equalTo(buttonArray[i-1].snp.right).offset(imageGap)
                    make.width.equalTo(45)
                    make.height.equalTo(45)
                    make.top.equalTo(questionLabel.snp.bottom).offset(30)
                }
            }
            
            buttonLabel.snp.makeConstraints { (make) in
                make.top.equalTo(buttonArray[i].snp.bottom).offset(2)
                make.width.equalTo(buttonArray[i])
                make.height.equalTo(buttonArray[i])
                make.centerX.equalTo(buttonArray[i])
            }
            
        }
        

        
    }
    
    func setupSixButtons(imageDescArr: [String]) {
        let imageGap = 40.0
        
        var buttonArray: [UIButton] = []
        
        // top layer of buttons
        for i in 0...2 {
            let button = UIButton()
            button.setImage(UIImage(named: imageDescArr[i]), for: .normal)
            buttonArray.append(button)
            
            addSubview(button)
            
            if (i == 0) {
                button.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(30)
                    make.width.equalTo(80)
                    make.height.equalTo(80)
                    make.top.equalTo(questionLabel.snp.bottom).offset(30)
                }
            } else {
                button.snp.makeConstraints { (make) in
                    make.left.equalTo(buttonArray[i-1].snp.right).offset(imageGap)
                    make.width.equalTo(80)
                    make.height.equalTo(80)
                    make.top.equalTo(questionLabel.snp.bottom).offset(30)
                }
            }
        }
        
        
        // bottom layer of buttons
        for i in 3...5 {
            let button = UIButton()
            button.setImage(UIImage(named: imageDescArr[i]), for: .normal)
            button.contentMode = .scaleToFill
            buttonArray.append(button)
            
            addSubview(button)
            
            if (i == 3) {
                button.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(30)
                    make.width.equalTo(80)
                    make.height.equalTo(80)
                    make.top.equalTo(buttonArray[i-3].snp.bottom).offset(30)
                }
            } else {
                button.snp.makeConstraints { (make) in
                    make.left.equalTo(buttonArray[i-1].snp.right).offset(imageGap)
                    make.width.equalTo(80)
                    make.height.equalTo(80)
                    make.top.equalTo(buttonArray[i-3].snp.bottom).offset(30)
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
