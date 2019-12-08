//
//  StatsViewController.swift
//  
//
//  Created by Yeo Hwee Lin on 12/3/19.
//

import UIKit

class StatsViewController: UIViewController {
    
    let headerNameLabel = UILabel()
    var bottomView = UIView()
    var dietCard = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupHeaderName()
        setupBottomView()
        addDietCard()
    }
    
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.locations = [0.0, 0.3]
        gradientLayer.colors = [SDColor.pinkTop.cgColor, SDColor.pinkOrangeBottom.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func setupHeaderName() {
        headerNameLabel.font = SDFont(type: .mediumBlack, size: .large).instance
        headerNameLabel.textColor = .white
        headerNameLabel.text = "Statistics"
        
        view.addSubview(headerNameLabel)
        
        headerNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(30)
        }
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.backgroundColor = .white
        
        bottomView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
            make.bottom.equalToSuperview()
        }
    }
    
    func addDietCard() {
        dietCard.backgroundColor = .white
        bottomView.addSubview(dietCard)
        
        dietCard.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(80)
        }
        
        let dietLabel = UILabel()
        dietLabel.text = "YOUR DIET"
        dietLabel.font = SDFont(type: .mediumBlack, size: .largeSmall).instance
        let dietImageView = UIImageView(image: UIImage(named: "dairyProducts"))
        
        dietCard.addSubview(dietLabel)
        dietCard.addSubview(dietImageView)
        
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
        
        
        
//        addSkinConditionButtons(["Acne", "Blackheads", "Dryness & Dehydration", "Fatigue/Radiance"])
    }
    
    func addSkinConditionButtons(_ skinCondArr: [String]) {
        
    }
        
}
