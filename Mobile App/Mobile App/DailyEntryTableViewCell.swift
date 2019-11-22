//
//  DailyEntryTableViewCell.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/21/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

enum CellType: Int {
    
    case feel = 1
    case hydration = 2
    case sleep = 3
    case eat = 4
    case products = 5
    
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
            setupFiveButtons(imageDesArr: ["excited", "happy", "meh",  "sad", "stressed"])
            break
        case .hydration:
            setupFiveButtons(imageDesArr: ["2Cups", "34Cups","56Cups","78Cups","8Cups"])
            break
        case .sleep:
            setupFiveButtons(imageDesArr: ["2Hours","34Hours","56Hours","78Hours","8Hours"])
            break
        case .eat:
            setupFiveButtons(imageDesArr: ["excited", "happy", "meh",  "sad", "stressed"])
            break
        case .products:
            setupFiveButtons(imageDesArr: ["excited", "happy", "meh",  "sad", "stressed"])
            break
        }
        

    }
    func setupFiveButtons(imageDesArr: [String]) {

        let imageGap = 25.0

        var buttonArray: [UIButton] = []

        for i in 0...4 {
            let button = UIButton()
            button.setImage(UIImage(named: imageDesArr[i]), for: .normal)
            buttonArray.append(button)

            addSubview(button)

            if (i == 0) {
                button.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(30)
                    make.width.equalTo(50)
                    make.height.equalTo(50)
                    make.top.equalTo(questionLabel.snp.bottom).offset(20)
                }
            } else {
                button.snp.makeConstraints { (make) in
                    make.left.equalTo(buttonArray[i-1].snp.right).offset(imageGap)
                    make.width.equalTo(50)
                    make.height.equalTo(50)
                    make.top.equalTo(questionLabel.snp.bottom).offset(20)
                }
            }
        }
    }
    
    func setupSixButtons() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
