//
//  DietStatsViewCell.swift
//  dayly
//
//  Created by Yeo Hwee Lin on 12/9/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class DietStatsViewCell : UITableViewCell {
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        self.selectionStyle = .none
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        let dietLabel = UILabel()
        dietLabel.text = "YOUR DIET"
        dietLabel.font = SDFont(type: .mediumBlack, size: .largeSmall).instance
        let dietImageView = UIImageView(image: UIImage(named: "dairyProducts"))
        
        contentView.addSubview(dietLabel)
        contentView.addSubview(dietImageView)
        
        dietImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.width.equalTo(50)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
        
        dietLabel.snp.makeConstraints { (make) in
            make.left.equalTo(dietImageView.snp.right).offset(30)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(22)
        }
        
        let dietPieChart = UIImageView(image: UIImage(named: "pieChart"))
        
        let carbIndi = UIImageView(image: UIImage(named: "carbIndi"))
        let dairyIndi = UIImageView(image: UIImage(named: "dairyProductsIndi"))
        let meatIndi = UIImageView(image: UIImage(named: "meatIndi"))
        let seafoodIndi = UIImageView(image: UIImage(named: "seafoodIndi"))
        let vegeIndi = UIImageView(image: UIImage(named: "vegeIndi"))
        
        let indiArray = [carbIndi, dairyIndi, meatIndi, seafoodIndi, vegeIndi]
        
        contentView.addSubview(dietPieChart)
        for indi in indiArray {
            contentView.addSubview(indi)
        }
        
        dietPieChart.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.top.equalTo(dietImageView.snp.bottom).offset(20)
            make.height.equalTo(300)
        }
        
        carbIndi.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.top.equalTo(dietPieChart.snp.bottom).offset(40)
            make.height.equalTo(30)
        }
        
        seafoodIndi.snp.makeConstraints { (make) in
            make.left.equalTo(carbIndi.snp.right).offset(50)
            make.top.equalTo(dietPieChart.snp.bottom).offset(40)
            make.height.equalTo(30)
        }
        
        for index in indiArray.indices {
            if (index == 0 || index == 3) { continue }
            if (index <= 2) {
                indiArray[index].snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(25)
                    make.top.equalTo(indiArray[index-1].snp.bottom).offset(30)
                    make.height.equalTo(30)
                }
                continue
            }
            
            indiArray[index].snp.makeConstraints { (make) in
                make.left.equalTo(indiArray[index-3].snp.right).offset(50)
                make.top.equalTo(indiArray[index-1].snp.bottom).offset(30)
                make.height.equalTo(30)
            }
        }
    }
}
