//
//  ListStatsViewCell.swift
//  dayly
//
//  Created by Yeo Hwee Lin on 12/10/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class ListStatsViewCell : UITableViewCell {
    
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
        cellLabel.text = "PRODUCTS"
        cellLabel.numberOfLines = 2
        cellLabel.lineBreakMode = .byWordWrapping
        cellLabel.font = SDFont(type: .mediumBlack, size: .largeSmall).instance
        
        let noDaysLabel = SDIconLabel(text: "NO. OF DAYS").instance
        
        contentView.addSubview(cellLabel)
        contentView.addSubview(noDaysLabel)
        
        cellLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(42)
        }
        
        noDaysLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(cellLabel.snp.bottom).offset(20)
            make.height.equalTo(20)
        }
        
        var productsImageViews: [UIImageView]
        
        let correctingDay = UIImageView(image: UIImage(named: "correctingDay"))
        let extractorDay = UIImageView(image: UIImage(named: "extractorDay"))
        let eyesDay = UIImageView(image: UIImage(named: "eyesDay"))
        let gelDay = UIImageView(image: UIImage(named: "gelDay"))
        let mosDay = UIImageView(image: UIImage(named: "mosDay"))
        let serumDay = UIImageView(image: UIImage(named: "serumDay"))
        
        productsImageViews = [correctingDay, extractorDay, eyesDay, gelDay, mosDay, serumDay]
        
        for index in productsImageViews.indices {
            contentView.addSubview(productsImageViews[index])
            
            if (index == 0) {
                productsImageViews[0].snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(25)
                    make.top.equalTo(noDaysLabel.snp.bottom).offset(20)
                    make.height.equalTo(40)
                    make.right.equalToSuperview().offset(-50)
                }
                
                continue
            }
            
            productsImageViews[index].snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(25)
                make.top.equalTo(productsImageViews[index-1].snp.bottom).offset(30)
                make.height.equalTo(40)
                make.right.equalToSuperview().offset(-50)
            }
        
        }
    }
}
