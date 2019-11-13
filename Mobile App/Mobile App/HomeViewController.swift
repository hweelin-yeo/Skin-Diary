//
//  ViewController.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 10/25/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit
import SnapKit

func generateGreetingLabel() -> UILabel {
    
    let label = UILabel()
    label.font = SDFont(type: .bold).instance
    label.textColor = .white
    
    return label
}

class HomeViewController: UIViewController {
    
    var greetingView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupGreetings(name: "Kaitlyn")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupGreetings(name: String) {
        greetingView = UIView()
        
        guard let superview = self.view, let greetingView = greetingView else {
            return
        }
        
        superview.addSubview(greetingView)
        greetingView.backgroundColor = UIColor(hexString: "#54d289")
        
        greetingView.snp.makeConstraints { (make) in
            make.width.equalTo(superview)
            make.height.equalTo(superview).multipliedBy(0.3)
            make.top.equalTo(superview)
        }
        
        let nameLabel1 = UILabel()
        let nameLabel2 = UILabel()
        nameLabel1.text = "Good Morning,"
        nameLabel2.text = "\(name)"
        nameLabel1.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        nameLabel2.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        nameLabel1.textColor = .white
        nameLabel2.textColor = .white
        
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
        guard let greetingView = greetingView else {
            return
        }

        let weatherStackView = UIView() // UIStackView()

        let weatherDescr = UILabel()
        weatherDescr.text = "Sunny, 33F"
        weatherDescr.font = UIFont(name:"HelveticaNeue-Medium", size: 12.0)
        weatherDescr.textColor = .white

        let locationDescr = UILabel()
        locationDescr.text = "Roosevelt Island, NY"
        locationDescr.font = UIFont(name:"HelveticaNeue-Medium", size: 12.0)
        locationDescr.textColor = .white
        
//        weatherStackView.axis  = .vertical
//        weatherStackView.spacing = 5
        
//        weatherStackView.addArrangedSubview(weatherDescr)
//        weatherStackView.addArrangedSubview(locationDescr)

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

        weatherStackView.snp.makeConstraints { (make) in
            make.width.equalTo(greetingView)
            make.left.equalTo(greetingView).offset(100)
            make.height.equalTo(greetingView).multipliedBy(0.25)
            make.bottom.equalTo(greetingView).offset(-10)
        }
    }


}

