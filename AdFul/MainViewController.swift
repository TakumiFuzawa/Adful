//
//  ViewController.swift
//  AdFul
//
//  Created by Takumi Fuzawa on 2021/03/31.
//

import UIKit

class MainViewController: UIViewController {
    
    let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        //mainlableの作成
        let mainLabel = UILabel()
        mainLabel.text = "ドライバーアプリへようこそ"
        mainLabel.textColor = colors.black
        mainLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        mainLabel.frame = CGRect(x: 0, y: 100, width: 370, height: 50)
        mainLabel.numberOfLines = 0
        view.addSubview(mainLabel)
        
        //image
        createImageView()
        
        //登録ボタン、サインインボタン
        createButton()
            
    }
    //uiimageの作成
    func createImageView() {
        let uiimageView = UIImageView()
        uiimageView.image = UIImage(named: "driver")
        uiimageView.frame = CGRect(x: 0, y: 200, width: 400, height: 300)
        uiimageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.addSubview(uiimageView)
    }
    
    //CreateButton
    func createButton() {
        //高さと
        let height = view.frame.size.height / 2
        //サインインボタン
        let signInButton: UIButton = UIButton(frame: CGRect(x: 118, y: height + 200, width: 150, height: 60))
        signInButton.backgroundColor = .systemGray4
        signInButton.layer.cornerRadius = 8
        signInButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        signInButton.layer.shadowColor = UIColor.gray.cgColor
        signInButton.layer.shadowOpacity = 1
        signInButton.setTitle("はじめる", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        signInButton.titleLabel?.adjustsFontSizeToFitWidth = true
        signInButton.setTitleColor(colors.black, for: .normal)
        signInButton.addTarget(self, action: #selector(actionSignIn), for: .touchUpInside)
        view.addSubview(signInButton)
        
    }
    
    //CreateButtonのタップ時のアクション
    @objc func actionSignIn() {
        performSegue(withIdentifier: "actionSignIn", sender: nil)
    }
    
    
}

