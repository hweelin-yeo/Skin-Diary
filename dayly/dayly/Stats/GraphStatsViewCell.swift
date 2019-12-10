//
//  GraphStatsViewCell.swift
//  dayly
//
//  Created by Yeo Hwee Lin on 12/9/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

enum GraphStatsViewCellType: Int {
    
    case sleep = 0
    case feelings = 1
    
    var description: String {
        switch self {
        case .sleep: return "SLEEP"
        case .feelings: return "FEELINGS"
        }
    }
}

class GraphStatsViewCell : UITableViewCell {
    
    var cellType: GraphStatsViewCellType
    
    init(cellType: GraphStatsViewCellType) {
        self.cellType = cellType
        super.init(style: .default, reuseIdentifier: "graphStatsViewCell")
        self.selectionStyle = .none
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        let cellLabel = UILabel()
        cellLabel.text = cellType.description
        cellLabel.font = SDFont(type: .mediumBlack, size: .largeSmall).instance
        
        var iconImageView: UIImageView
        
        switch cellType {
        case .sleep:
            iconImageView = UIImageView(image: UIImage(named: "56Hours"))
            break
        case .feelings:
            iconImageView = UIImageView(image: UIImage(named: "excited"))
            break
        }
        
        contentView.addSubview(cellLabel)
        contentView.addSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.width.equalTo(50)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(50)
        }
        
        cellLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(30)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(22)
        }
        
        var icons: [UIImageView]
        var iconLabels: [UILabel]
        var graphImageView: UIImageView
        
        switch cellType {
        case .sleep:
            let twoH = UIImageView(image: UIImage(named: "2Hours"))
            let threeFourH = UIImageView(image: UIImage(named: "34Hours"))
            let fiveSixH = UIImageView(image: UIImage(named: "56Hours"))
            let sevenEightH = UIImageView(image: UIImage(named: "78Hours"))
            let eightH = UIImageView(image: UIImage(named: "8Hours"))
            
            let twoIL = SDIconLabel(text: "2").instance
            let threeFourIL = SDIconLabel(text: "4").instance
            let fiveSixIL = SDIconLabel(text: "6").instance
            let sevenEightIL = SDIconLabel(text: "8").instance
            let eightIL = SDIconLabel(text: ">8").instance
            
            icons = [twoH, threeFourH, fiveSixH, sevenEightH, eightH]
            iconLabels = [twoIL, threeFourIL, fiveSixIL, sevenEightIL, eightIL]
            graphImageView = UIImageView(image: UIImage(named: "sleepGraph"))
            break
        case .feelings:
            let excited = UIImageView(image: UIImage(named: "excited"))
            let happy = UIImageView(image: UIImage(named: "happy"))
            let meh = UIImageView(image: UIImage(named: "meh"))
            let sad = UIImageView(image: UIImage(named: "sad"))
            let stressed = UIImageView(image: UIImage(named: "stressed"))
            
            let excitedIL = SDIconLabel(text: "EXCITED").instance
            let happyIL = SDIconLabel(text: "HAPPY").instance
            let mehIL = SDIconLabel(text: "MEH").instance
            let sadIL = SDIconLabel(text: "SAD").instance
            let stressedIL = SDIconLabel(text: "STRESSED").instance
            
            icons = [excited, happy, meh, sad, stressed]
            iconLabels = [excitedIL, happyIL, mehIL, sadIL, stressedIL]
            graphImageView = UIImageView(image: UIImage(named: "feelingGraph"))
            
            break
        }
        
        contentView.addSubview(graphImageView)
        
       for index in icons.indices {
            contentView.addSubview(icons[index])
            contentView.addSubview(iconLabels[index])
        
            if (index == 0) {
                icons[0].snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(25)
                    make.top.equalTo(cellLabel.snp.bottom).offset(70)
                    make.height.equalTo(20)
                    make.width.equalTo(20)
                }
                
                iconLabels[0].snp.makeConstraints { (make) in
                    make.left.equalTo(icons[index].snp.right).offset(10)
                    make.top.equalTo(icons[index]).offset(5)
                    make.height.equalTo(10)
                }
                
                
                continue
            }
        
            icons[index].snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(25)
                make.top.equalTo(icons[index-1].snp.bottom).offset(30)
                make.height.equalTo(20)
                make.width.equalTo(20)
            }
        
        iconLabels[index].snp.makeConstraints { (make) in
            make.left.equalTo(icons[index].snp.right).offset(10)
            make.top.equalTo(icons[index]).offset(5)
            make.height.equalTo(10)
        }
        }
        
        graphImageView.snp.makeConstraints { (make) in
            make.left.equalTo(icons[0].snp.right).offset(60)
            make.width.equalTo(275)
            make.top.equalTo(cellLabel.snp.bottom).offset(70)
            make.height.equalTo(250)
        }
    }
}



