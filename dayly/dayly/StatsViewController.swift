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
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupHeaderName()
        setupBottomView()
        
        tableView.tableFooterView = UIView()
        tableView.register(GraphStatsViewCell.self, forCellReuseIdentifier: "graphStatsViewCell")
        setupTableView()
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
            make.height.equalToSuperview().multipliedBy(0.85)
            make.bottom.equalToSuperview()
        }
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
    
    func addSkinConditionButtons(_ skinCondArr: [String]) {
        
        
    }
}

extension StatsViewController: UITableViewDelegate {
    
}

extension StatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) { return DietStatsViewCell()}
        if (indexPath.row == 2) { return GraphStatsViewCell(cellType: .sleep)}
        if (indexPath.row == 1) { return GraphStatsViewCell(cellType: .feelings)}
        if (indexPath.row == 3) { return ListStatsViewCell()}
        if (indexPath.row == 4) { return SkinStatsViewCell()}
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) { return 620}
        if (indexPath.row == 1 || indexPath.row == 2) { return 400}
        if (indexPath.row == 3) { return 550}
        if (indexPath.row == 4) { return 200}
        
        return 0
    }
    
    
}
