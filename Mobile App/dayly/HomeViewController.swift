//
//  ViewController.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 10/25/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var greetingView = UIView()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        
        tableView.sectionHeaderHeight = 45
        tableView.tableFooterView = UIView()
        
        setupGreetings(name: "Kaitlyn")
        setupTableView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Table View
    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(greetingView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: UI
    
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.locations = [0.0, 0.3]
        gradientLayer.colors = [SDColor.orangeTop.cgColor, SDColor.orangeBottom.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func setupGreetings(name: String) {
        
        view.addSubview(greetingView)
//        greetingView.backgroundColor = SDColor.turquoise
        
        
        
        greetingView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.3)
            make.top.equalToSuperview()
        }
        
        let nameLabel1 = generateGreetingLabel()
        let nameLabel2 = generateGreetingLabel()
        nameLabel1.text = "Good Morning,"
        nameLabel2.text = "\(name)"
        
        greetingView.addSubview(nameLabel1)
        greetingView.addSubview(nameLabel2)
        
        nameLabel1.snp.makeConstraints { (make) in
            make.left.equalTo(greetingView).offset(30)
            make.right.equalTo(greetingView).offset(30)
            make.top.equalTo(greetingView).offset(50)
            make.height.equalTo(greetingView).multipliedBy(0.25)
        }
        
        nameLabel2.snp.makeConstraints { (make) in
            make.left.equalTo(greetingView).offset(30)
            make.right.equalTo(greetingView).offset(30)
            make.top.equalTo(nameLabel1).offset(30)
            make.height.equalTo(greetingView).multipliedBy(0.25)
        }
        
        let reminderLabel = UILabel()
        reminderLabel.text = "Remember to put on your sunscreen!"
        reminderLabel.font = UIFont(name:"HelveticaNeue-Medium", size: 15.0)
        reminderLabel.textColor = .white
        greetingView.addSubview(reminderLabel)
        
        reminderLabel.snp.makeConstraints { (make) in
            make.left.equalTo(greetingView).offset(30)
            make.right.equalTo(greetingView).offset(30)
            make.top.equalTo(nameLabel2).offset(40)
            make.height.equalTo(greetingView).multipliedBy(0.25)
        }
        
        setupWeatherStack()
    }
    
    func setupWeatherStack() {

        let weatherStackView = UIView() // UIStackView()
        
        let weatherImageView = UIImageView()
        weatherImageView.image = UIImage(named: "sunWhite")

        let weatherDescr = UILabel()
        weatherDescr.text = "Sunny, 33F"
        weatherDescr.font = UIFont(name:"HelveticaNeue-Medium", size: 12.0)
        weatherDescr.textColor = .white

        let locationDescr = UILabel()
        locationDescr.text = "Roosevelt Island, NY"
        locationDescr.font = UIFont(name:"HelveticaNeue-Medium", size: 12.0)
        locationDescr.textColor = .white

        weatherStackView.addSubview(weatherDescr)
        weatherStackView.addSubview(locationDescr)
        
        weatherDescr.snp.makeConstraints { (make) in
            make.left.equalTo(weatherStackView).offset(10)
            make.right.equalTo(weatherStackView).offset(10)
            make.top.equalTo(weatherStackView).offset(10)
            make.height.equalTo(12)
        }

        locationDescr.snp.makeConstraints { (make) in
            make.left.equalTo(weatherStackView).offset(10)
            make.right.equalTo(weatherStackView).offset(10)
            make.top.equalTo(weatherDescr).offset(12)
            make.height.equalTo(12)
        }

        greetingView.addSubview(weatherStackView)
        greetingView.addSubview(weatherImageView)
        
        weatherImageView.snp.makeConstraints { (make) in
            make.width.equalTo(37)
            make.height.equalTo(37)
            make.left.equalTo(greetingView).offset(30)
            make.bottom.equalTo(greetingView).offset(-35)
        }

        weatherStackView.snp.makeConstraints { (make) in
            make.width.equalTo(greetingView)
            make.left.equalTo(weatherImageView.snp.right).offset(15)
            make.height.equalTo(greetingView).multipliedBy(0.25)
            make.bottom.equalTo(greetingView).offset(-10)
        }
    }
    
    func generateGreetingLabel() -> UILabel {
        
        let label = UILabel()
        label.font = SDFont(type: .bold, size: .large).instance
        label.textColor = .white
        
        return label
    }


}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
// just for demo purposes sorry!!!
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return generateHeaderView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return generateTableViewCells()[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
}

// MARK: - UI (HeaderView)
extension HomeViewController {
    
    func generateHeaderView() -> UIView {
        let labels = generateLabelsArray(["Weather", "Feeling", "Sleep", "Water", "Products Used"])
        
        let headerView = UIView()
        headerView.backgroundColor = SDColor.lightGray
        
        let labelWidth = 47.0
        let labelHeight = 28.0
        let labelGap = 15.0
        
        for (index, label) in labels.enumerated() {
            headerView.addSubview(label)
            
            if (index == 0) {
                label.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(100)
                    make.centerY.equalToSuperview()
                    make.height.equalTo(labelHeight)
                    make.width.equalTo(labelWidth)
                    
                }
            } else {
                label.snp.makeConstraints { (make) in
                    make.left.equalTo(labels[index-1].snp.right).offset(labelGap)
                    make.centerY.equalToSuperview()
                    make.height.equalTo(labelHeight)
                    make.width.equalTo(labelWidth)
                }
            }
            
            
        }
        
        return headerView
    }
    
    func generateLabelsArray(_ names: [String]) -> [UILabel] {
        var res: [UILabel] = []
        for name in names {
            let label = UILabel()
            label.text = name
            label.font = SDFont(type: .medium, size: .mediumSmall).instance
            label.textColor = .darkGray
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 2;
            res.append(label)
        }
        
        return res
    }
}

// MARK: - UI (HeaderView)
extension HomeViewController {
    func generateTableViewCells() -> [UITableViewCell]{
        var res: [UITableViewCell] = []
        
        
        let cell1 = generateCell("Nov \n11", [UIImage(named: "sunPink")!,
                                              UIImage(named: "excited")!,
                                              UIImage(named: "56Hours")!,
                                              UIImage(named: "78Cups")!,
                                              UIImage(named: "70ProductUsed")!])
        
        let cell2 = generateCell("Nov \n9", [UIImage(named: "sunPink")!,
                                              UIImage(named: "excited")!,
                                              UIImage(named: "56Hours")!,
                                              UIImage(named: "78Cups")!,
                                              UIImage(named: "70ProductUsed")!])
        
        let cell3 = generateCell("Nov \n8", [UIImage(named: "cloud")!,
                                              UIImage(named: "meh")!,
                                              UIImage(named: "78Hours")!,
                                              UIImage(named: "56Cups")!,
                                              UIImage(named: "allProductUsed")!])
        res.append(cell1)
        res.append(cell2)
        res.append(cell3)
        
        return res
        
        
    }
    
    func generateCell(_ date: String, _ pics: [UIImage]) -> UITableViewCell {
        
        let dateLabelWidth = 37.0
        let dateLabelHeight = 47.0
        let dateLabelGap = 15.0
        
        let imageWidth = 35.0
        let imageHeight = 35.0
        let imageGap = 27.0
        
        let cell = UITableViewCell()
        
        let dateLabel = UILabel()
        dateLabel.textAlignment = .center
        dateLabel.text = date
        dateLabel.font = UIFont(name: "Avenir-Heavy", size: 12.0)
        dateLabel.textColor = .darkGray
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.numberOfLines = 2;
        
        cell.contentView.addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(dateLabelGap)
            make.centerY.equalToSuperview()
            make.height.equalTo(dateLabelHeight)
            make.width.equalTo(dateLabelWidth)
            
        }
        
        let imageViewArray = pics.map { UIImageView(image: $0)}
        
        for (index, imageView) in imageViewArray.enumerated() {
            cell.contentView.addSubview(imageView)
            
            if (index == 0) {
                imageView.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(100)
                    make.centerY.equalToSuperview()
                    make.height.equalTo(imageHeight)
                    make.width.equalTo(imageWidth)
                    
                }
            } else {
                imageView.snp.makeConstraints { (make) in
                    make.left.equalTo(imageViewArray[index-1].snp.right).offset(imageGap)
                    make.centerY.equalToSuperview()
                    make.height.equalTo(imageHeight)
                    make.width.equalTo(imageWidth)
                }
            }
            
            
        }
        
        
        
        return cell
        
    }
    
}
