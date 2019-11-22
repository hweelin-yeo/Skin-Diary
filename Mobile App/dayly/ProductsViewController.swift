//
//  ProductsViewController.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/22/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    var tableView = UITableView()
    var bottomView = UIView()
    
    let recommendationView = UIView()
    let addNewButton = UIButton()
    let headerNameLabel = UILabel()
    
    let imageArr = ["acne", "blackhead", "eyes", "lotion"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupBottomView()
        
        setupAddNewButton()
        setupHeaderName()
        setupRecommendationView()
        
        setupTableView()
        
        tableView.tableFooterView = UIView()
        tableView.register(DailyEntryTableViewCell.self, forCellReuseIdentifier: "dailyEntryCellID")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    func setupHeaderName() {
        headerNameLabel.font = SDFont(type: .mediumBlack, size: .large).instance
        headerNameLabel.textColor = .white
        headerNameLabel.text = "Your Products"
        
        view.addSubview(headerNameLabel)
        
        headerNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.right.equalTo(addNewButton.snp.left).offset(20)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(30)
        }
    }
    
    func setupAddNewButton() {
        addNewButton.setTitle("Add New", for: .normal)
        addNewButton.setTitleColor(.white, for: .normal)
        addNewButton.setTitleColor(.blue, for: .selected)
        
        view.addSubview(addNewButton)
        
        addNewButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(26)
            make.width.equalTo(80)
        }
    }
    
    
    
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.locations = [0.0, 0.3]
        gradientLayer.colors = [SDColor.pinkTop.cgColor, SDColor.pinkOrangeBottom.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func setupTableView() {
        bottomView.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(70)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.backgroundColor = .white
        
        bottomView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupRecommendationView() {
        let shadowView = UIView()
        shadowView.backgroundColor = UIColor(hexString: "#E0E0E0")
        view.addSubview(shadowView)
        shadowView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.91)
            make.top.equalTo(headerNameLabel.snp.bottom).offset(48)
            make.height.equalTo(182)
        }
        
        let recommendationView = UIView()
        recommendationView.backgroundColor = .white
        view.addSubview(recommendationView)
        
        recommendationView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.top.equalTo(headerNameLabel.snp.bottom).offset(50)
            make.height.equalTo(179)
        }
        
        shadowView.layer.masksToBounds = true
        shadowView.layer.cornerRadius = 5
        recommendationView.layer.masksToBounds = true
        recommendationView.layer.cornerRadius = 5
        
        let mayNeedLabel = UILabel()
        mayNeedLabel.font = SDFont(type: .medium, size: .mediumLarger).instance
        mayNeedLabel.textColor = .black
        mayNeedLabel.text = "Your skin may also need"
        
        recommendationView.addSubview(mayNeedLabel)
        
        mayNeedLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(24)
        }
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lotion2")
        recommendationView.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(mayNeedLabel.snp.bottom).offset(25)
            make.height.equalTo(70)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
    }
    
    
}

extension ProductsViewController: UITableViewDelegate {
    
}

extension ProductsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let cellImageView = UIImageView()
        cellImageView.image = UIImage(named: imageArr[indexPath.row])
        cell.addSubview(cellImageView)
        
        cellImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
}



