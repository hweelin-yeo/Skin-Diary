//
//  DailyEntryViewController.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/17/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

protocol EntryDelegate: class {
    func refresh()
}

class DailyEntryViewController: UIViewController {
    
    var tableView = UITableView()
    var bottomView = UIView()
    
    let cameraView = UIImageView()
    var selfiePresent = false
    weak var entryDelegate: EntryDelegate?
    
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
        headerNameLabel.font = SDFont(type: .mediumBlack, size: .largeSmall).instance
        headerNameLabel.textColor = .white
        headerNameLabel.text = "DAILY ENTRY"

        view.addSubview(headerNameLabel)

        headerNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
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
        setupTapRecognizer()
    }
    
    func setupTapRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func setupTableView() {
        bottomView.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(120)
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
        let cell = DailyEntryTableViewCell(style: .default, reuseIdentifier: "dailyEntryCellID", index: indexPath.row)
        cell.submitButtonDelegate = self
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 150
        }
        
        if (indexPath.row <= 2) {
            return 200
        }
        
        if (indexPath.row == 5){
            return 50
        }
        
        return 280
    }
}

//class DailyEntryFooterView: UIView {
//    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        addButton()
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        addButton()
//    }
//    
//    
//    func addButton() {
//        let button = UIButton()
//        button.setTitle("Submit", for: .normal)
//        content.addSubview(button)
//        
//        
//        button.snp.makeConstraints { (make) in
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//            make.height.equalToSuperview()
//        }
//    }
//    
//}

extension DailyEntryViewController: UINavigationControllerDelegate {
    
}

extension DailyEntryViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        // print out the image size as a test
        displaySelfie(image: image)
    }
    
    func displaySelfie(image: UIImage) {
        cameraView.image = image
    }
    
    
}

extension DailyEntryViewController: SubmitButtonDelegate {
    
    func submitEntry() {
        let alert = UIAlertController(title: nil, message: "Updating...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            loadingIndicator.stopAnimating()
            self.dismiss(animated: false, completion: nil)
            self.entryDelegate?.refresh()
        }
        
    }
   
}
