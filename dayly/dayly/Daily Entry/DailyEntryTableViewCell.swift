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

protocol SubmitButtonDelegate: class {
    func submitEntry()
}

class DailyEntryTableViewCell: UITableViewCell {
    
    var submitButtonDelegate: SubmitButtonDelegate?
    
    private var questionType: CellType = .feel
    private let questionLabel = UILabel()
    
    private var feelSelection = Array(repeating: false, count: 5)
    private var hydrationSelection = Array(repeating: false, count: 5)
    private var sleepSelection = Array(repeating: false, count: 5)
    private var eatSelection = Array(repeating: false, count: 6)
    private var productsSelection = Array(repeating: false, count: 6)
    
    private var feelButtonArray: [UIButton] = []
    private var hydrationButtonArray: [UIButton] = []
    private var sleepButtonArray: [UIButton] = []
    private var eatButtonArray: [UIButton] = []
    private var productsButtonArray: [UIButton] = []
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, index: Int) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        if (index == 5) {
            setupSubmitButton()
            //setupGradient()
            return
        }
        setupQuestionType(index)
        setupQuestionLabel()
        setupButtons()
    }
    
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = contentView.frame
        gradientLayer.locations = [0.0, 0.5]
        gradientLayer.colors = [SDColor.pinkTop.cgColor, SDColor.pinkOrangeBottom.cgColor]
        
        contentView.layer.addSublayer(gradientLayer)
        
    }
    
    @objc func selectButtonTapped(_ sender: UIButton?) {
        submitButtonDelegate?.submitEntry()
    }
    
    func setupSubmitButton() {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font =  SDFont(type: .mediumBlack, size: .mediumLarge).instance
        button.addTarget(self, action: #selector(self.selectButtonTapped(_:)), for: .touchUpInside)
        
        contentView.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalToSuperview()
        }
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
            setupFiveButtons(buttonArr: &feelButtonArray,
                             cellType: .feel,
                             selBoolArray: feelSelection,
                             imageArr: ["excited", "happy", "meh",  "sad", "stressed"],
                             imageDescrArr: ["Excited", "Happy", "Meh",  "Sad", "Stressed"],
                             selecArr: ["excited-Selected", "happy-Selected", "meh-Selected",  "sad-Selected", "stressed-Selected"])
            break
        case .hydration:
            setupFiveButtons(buttonArr: &hydrationButtonArray,
                             cellType: .hydration,
                             selBoolArray: hydrationSelection,
                             imageArr: ["2Cups", "34Cups","56Cups","78Cups","8Cups"],
                             imageDescrArr: ["<2 Cups", "3-4 Cups","5-6 Cups","7-8 Cups",">8 Cups"],
                             selecArr: ["2Cups-Selected", "34Cups-Selected","56Cups-Selected","78Cups-Selected","8Cups-Selected"])
            break
        case .sleep:
            setupFiveButtons(buttonArr: &sleepButtonArray,
                             cellType: .sleep,
                             selBoolArray: sleepSelection,
                             imageArr: ["2Hours","34Hours","56Hours","78Hours","8Hours"],
                             imageDescrArr: ["<2 Hours", "3-4 Hours","5-6 Hours","7-8 Hours",">8 Hours"],
                             selecArr: ["2Hours-Selected","34Hours-Selected","56Hours-Selected","78Hours-Selected","8Hours-Selected"])
            break
        case .eat:
            setupSixButtons(cellType: .eat,
                            buttonArr: &eatButtonArray,
                            imageDescArr: ["dairy", "fish2", "meat",  "refinedCarbs", "sugar", "vegetablesFruit"],
                            selecArr: ["dairyChecked", "seafoodChecked", "meatChecked",  "carbVeg", "sugarChecked", "vegChecked"])
            break
        case .products:
            setupSixButtons(cellType: .products,
                            buttonArr: &productsButtonArray,
                            imageDescArr: ["Clinique-Green", "Clinique-Offwhite", "Clinique-Pink",  "Clinique-Turquouise", "Clinique-White", "Clinique-Yellow"],
                            selecArr: ["moisturizerChecked", "poresSerumChecked", "eyesChecked",  "serumChecked", "extractorChecked", "moisturizingGelChecked"])
            break
        }
        

    }
    
    func returnIndTrue(_ arr: [Bool]) -> Int {
        for i in arr.indices {
            if (arr[i]) { return i}
        }
        return -1
    }
    
    @objc func buttonTapped(_ sender: UIButton?) {
        
        guard let sender = sender else { return }
        let cellType = sender.tag / 10
        let ind = sender.tag % 10
        switch cellType {
            
        case 0:
            // another selection prev done
            if (!feelSelection[ind]) {
                let ind = returnIndTrue(feelSelection)
                if (ind != -1) {
                    feelSelection[ind] = false
                    setupSelectedBoolButton(feelButtonArray[ind], feelSelection[ind])
                    
                }
            }
            
            feelSelection[ind] = !feelSelection[ind]
            setupSelectedBoolButton(sender, feelSelection[ind])
            return
            
        case 1:
            // another selection prev done
            if (!hydrationSelection[ind]) {
                let ind = returnIndTrue(hydrationSelection)
                if (ind != -1) {
                    hydrationSelection[ind] = false
                    setupSelectedBoolButton(hydrationButtonArray[ind], hydrationSelection[ind])
                    
                }
            }
            hydrationSelection[ind] = !hydrationSelection[ind]
            setupSelectedBoolButton(sender, hydrationSelection[ind])
            return
        case 2:
            if (!sleepSelection[ind]) {
                let ind = returnIndTrue(sleepSelection)
                if (ind != -1) {
                    sleepSelection[ind] = false
                    setupSelectedBoolButton(sleepButtonArray[ind], sleepSelection[ind])
                    
                }
            }
            
            sleepSelection[ind] = !sleepSelection[ind]
            setupSelectedBoolButton(sender, sleepSelection[ind])
            return
        case 3:
            if (!eatSelection[ind]) {
                let ind = returnIndTrue(eatSelection)
                if (ind != -1) {
//                    eatSelection[ind] = false
                    setupSelectedBoolButton(eatButtonArray[ind], eatSelection[ind])
                    
                }
            }
            
            eatSelection[ind] = !eatSelection[ind]
            setupSelectedBoolButton(sender, eatSelection[ind])
            return
        default:
            if (!productsSelection[ind]) {
                let ind = returnIndTrue(productsSelection)
                if (ind != -1) {
//                    productsSelection[ind] = false
                    setupSelectedBoolButton(productsButtonArray[ind], productsSelection[ind])
                    
                }
            }
            
            productsSelection[ind] = !productsSelection[ind]
            setupSelectedBoolButton(sender, productsSelection[ind])
            return
        }
        
    }
    
    func setupSelectedBoolButton(_ button: UIButton, _ bool: Bool) {
        button.isSelected = bool ? true : false
        
    }
    
    func setupFiveButtons(buttonArr: inout [UIButton], cellType: CellType, selBoolArray: [Bool], imageArr: [String], imageDescrArr: [String], selecArr: [String]) {

        let imageGap = 25.0

        for i in 0...4 {
            let button = UIButton()
            
            button.isSelected = selBoolArray[i] ? true : false
            
            button.setImage(UIImage(named: imageArr[i]), for: .normal)
            button.setImage(UIImage(named: selecArr[i]), for: .selected)
            button.setImage(UIImage(named: selecArr[i]), for: .highlighted)
            
            button.tag = cellType.rawValue * 10 + i
            button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
            
            button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            
            let buttonLabel = UILabel()
            buttonLabel.text = imageDescrArr[i]
            buttonLabel.font = SDFont(type: .medium, size: .mediumSmall).instance
            buttonLabel.textAlignment = .center
            buttonLabel.textColor = .gray
            
            buttonArr.append(button)
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
                    make.left.equalTo(buttonArr[i-1].snp.right).offset(imageGap)
                    make.width.equalTo(45)
                    make.height.equalTo(45)
                    make.top.equalTo(questionLabel.snp.bottom).offset(30)
                }
            }
            
            buttonLabel.snp.makeConstraints { (make) in
                make.top.equalTo(buttonArr[i].snp.bottom).offset(2)
                make.width.equalTo(buttonArr[i])
                make.height.equalTo(buttonArr[i])
                make.centerX.equalTo(buttonArr[i])
            }
            
        }
        

        
    }
    
    func setupSixButtons(cellType: CellType, buttonArr: inout [UIButton], imageDescArr: [String], selecArr: [String]) {
        let imageGap = 40.0
        
        // top layer of buttons
        for i in 0...2 {
            let button = UIButton()
            button.setImage(UIImage(named: imageDescArr[i]), for: .normal)
            button.setImage(UIImage(named: selecArr[i]), for: .selected)
            button.setImage(UIImage(named: selecArr[i]), for: .highlighted)
            
            button.tag = cellType.rawValue * 10 + i
            button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
            buttonArr.append(button)
            
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
                    make.left.equalTo(buttonArr[i-1].snp.right).offset(imageGap)
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
            button.setImage(UIImage(named: selecArr[i]), for: .selected)
            button.setImage(UIImage(named: selecArr[i]), for: .highlighted)
            
            button.tag = cellType.rawValue * 10 + i
            button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
            
            button.contentMode = .scaleToFill
            buttonArr.append(button)
            
            addSubview(button)
            
            if (i == 3) {
                button.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(30)
                    make.width.equalTo(80)
                    make.height.equalTo(80)
                    make.top.equalTo(buttonArr[i-3].snp.bottom).offset(30)
                }
            } else {
                button.snp.makeConstraints { (make) in
                    make.left.equalTo(buttonArr[i-1].snp.right).offset(imageGap)
                    make.width.equalTo(80)
                    make.height.equalTo(80)
                    make.top.equalTo(buttonArr[i-3].snp.bottom).offset(30)
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
