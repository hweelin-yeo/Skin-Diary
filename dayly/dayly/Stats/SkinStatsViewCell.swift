//
//  SkinStatsViewCell.swift
//  dayly
//
//  Created by Yeo Hwee Lin on 12/10/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class SkinStatsViewCell : UITableViewCell {
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        self.selectionStyle = .none
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        let cellLabel = UILabel()
        cellLabel.text = "SKIN ANALYSIS"
        cellLabel.font = SDFont(type: .mediumBlack, size: .largeSmall).instance
        
        let comingSoonLabel = UILabel()
        comingSoonLabel.text = "Coming Soon"
        comingSoonLabel.textColor = SDColor.darkGray
        comingSoonLabel.font = SDFont(type: .medium, size: .mediumLarge).instance
        
        contentView.addSubview(cellLabel)
        contentView.addSubview(comingSoonLabel)
        
        cellLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(22)
        }
        
        comingSoonLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(cellLabel.snp.bottom).offset(20)
            make.height.equalTo(20)
        }
    }
        
}
