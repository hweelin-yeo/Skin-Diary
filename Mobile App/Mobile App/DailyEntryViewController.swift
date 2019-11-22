//
//  DailyEntryViewController.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/17/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class DailyEntryViewController: UIViewController {
    
    var tableView = UITableView()
    var bottomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupHeaderName()
        
        setupBottomView()
        setupCameraView()
        setupTableView()
        
        tableView.tableFooterView = UIView()
        tableView.register(DailyEntryTableViewCell.self, forCellReuseIdentifier: "dailyEntryCellID")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    
    func setupHeaderName() {
        let headerNameLabel = UILabel()
        headerNameLabel.textAlignment = .center
        headerNameLabel.font = SDFont(type: .mediumBlack, size: .mediumLarge).instance
        headerNameLabel.textColor = .white
        headerNameLabel.text = "DAILY ENTRY"
        
        view.addSubview(headerNameLabel)
        
        headerNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(16)
            make.width.equalTo(232)
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
    
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.locations = [0.0, 0.3]
        gradientLayer.colors = [SDColor.pinkTop.cgColor, SDColor.pinkOrangeBottom.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    
    func setupCameraView() {
        let cameraView = UIImageView()
        cameraView.image = UIImage(named: "camera")
        view.addSubview(cameraView)
        
        cameraView.snp.makeConstraints { (make) in
            make.width.equalTo(164)
            make.height.equalTo(164)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
        }
        
        cameraView.layer.masksToBounds = true
        cameraView.layer.cornerRadius = 164/2
        
        cameraView.backgroundColor = .white
    }
    
    func setupTableView() {
        bottomView.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

}

extension DailyEntryViewController: UITableViewDelegate {
    
}

extension DailyEntryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) { return UITableViewCell() }
        
        return DailyEntryTableViewCell(style: .default, reuseIdentifier: "dailyEntryCellID", index: indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 120
        }
        
        return 170
    }
    
    
}
