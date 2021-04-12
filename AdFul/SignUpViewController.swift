//
//  SignInViewController.swift
//  AdFul
//
//  Created by Takumi Fuzawa on 2021/04/02.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let colors = Colors()
    
    //    private let radioButton: UIButton = {
    //
    //        let button = UIButton()
    //        button.frame = CGRect(x: 60, y:465 , width: 15, height: 15)
    //        button.layer.borderWidth = 2
    //        button.layer.borderColor = UIColor.gray.cgColor
    //        button.addTarget(self, action: #selector(didTapRadioButton), for: .touchUpInside)
    //        return button
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //キーボード閉じる（他の場所タップ）
        setDismissKeyboard()
        //画面のスクロール
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 860)
        view.addSubview(scrollView)
        
        let gradientLayer1 = CAGradientLayer()
        gradientLayer1.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60)
        gradientLayer1.colors = [colors.yellowOrange.cgColor, colors.orange.cgColor,]
        gradientLayer1.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer1.endPoint = CGPoint.init(x: 1, y: 1)
        scrollView.layer.insertSublayer(gradientLayer1, at: 0)
        
        
        //uiimage
        let adfulImageView = UIImageView()
        let image = UIImage(named: "logo")
        adfulImageView.image = image
        adfulImageView.frame = CGRect(x: 35, y: 15, width: 70, height: 30)
        adfulImageView.contentMode = .scaleAspectFill
        scrollView.addSubview(adfulImageView)
        
        //Adfulとは?
        let adfulButton = UIButton(type: .system)
        adfulButton.frame = CGRect(x: view.frame.size.width - 210, y: 20, width: 100, height: 20)
        adfulButton.setTitle("Adfulとは？", for: .normal)
        adfulButton.setTitleColor(colors.black, for: .normal)
        adfulButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        adfulButton.addTarget(self, action: #selector(goAdful), for: .touchUpInside)
        scrollView.addSubview(adfulButton)
        
        //お問い合わせ
        let contactButton = UIButton(type: .system)
        contactButton.frame = CGRect(x: view.frame.size.width - 110, y: 20, width: 100, height: 20)
        contactButton.setTitle("お問い合わせ", for: .normal)
        contactButton.setTitleColor(colors.black, for: .normal)
        contactButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        contactButton.addTarget(self, action: #selector(goContact), for: .touchUpInside)
        scrollView.addSubview(contactButton)
        
        //ドライバー登録
        let driverLable = UILabel()
        driverLable.frame = CGRect(x: 60, y: 100, width: 200, height: 25)
        driverLable.text = "ドライバー登録"
        driverLable.textColor = colors.black
        driverLable.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        scrollView.addSubview(driverLable)
        
        //個人情報
        let personalInformationLable = UILabel()
        personalInformationLable.frame = CGRect(x: 60, y: 140, width: 200, height: 20)
        personalInformationLable.text = "個人情報"
        personalInformationLable.textColor = colors.bluePurple
        personalInformationLable.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(personalInformationLable)
        
        //名前のテキストフィールド
        let nameTextFiled = UITextField()
        nameTextFiled.frame = CGRect(x: 60, y: 180, width: 250, height: 40)
        nameTextFiled.placeholder = "名前"
        nameTextFiled.tag = 1
        nameTextFiled.layer.borderWidth = 1
        nameTextFiled.layer.borderColor = UIColor.gray.cgColor
        nameTextFiled.clearButtonMode = .always
        nameTextFiled.keyboardType = .default
        scrollView.addSubview(nameTextFiled)
        nameTextFiled.delegate = self
        
        //textfiledNameの文字数
        let wordCountLabel = UILabel()
        wordCountLabel.frame = CGRect(x: view.frame.size.width - 125, y: 220, width: 100, height: 20)
        wordCountLabel.text = "30文字以内"
        wordCountLabel.textColor = UIColor.gray
        wordCountLabel.font = UIFont.systemFont(ofSize: 12)
        scrollView.addSubview(wordCountLabel)
        
        //電話番号のテキストフィールド
        let callNumberTextFiled = UITextField()
        callNumberTextFiled.frame = CGRect(x: 60, y: 250, width: 250, height: 40)
        callNumberTextFiled.placeholder = "電話番号"
        callNumberTextFiled.layer.borderWidth = 1
        callNumberTextFiled.layer.borderColor = UIColor.gray.cgColor
        callNumberTextFiled.clearButtonMode = .always
        callNumberTextFiled.keyboardType = .phonePad
        scrollView.addSubview(callNumberTextFiled)
        callNumberTextFiled.delegate = self
        
        //emailのテキストフィールド
        let emailTextFiled = UITextField()
        emailTextFiled.frame = CGRect(x: 60, y: 310, width: 250, height: 40)
        emailTextFiled.placeholder = "メールアドレス"
        emailTextFiled.layer.borderWidth = 1
        emailTextFiled.layer.borderColor = UIColor.gray.cgColor
        emailTextFiled.clearButtonMode = .always
        emailTextFiled.keyboardType = .emailAddress
        scrollView.addSubview(emailTextFiled)
        emailTextFiled.delegate = self
        
        //パスワードのテキストフィールド
        let passwordTextFiled = UITextField()
        passwordTextFiled.frame = CGRect(x: 60, y: 370, width: 250, height: 40)
        passwordTextFiled.placeholder = "パスワード"
        passwordTextFiled.tag = 2
        passwordTextFiled.layer.borderWidth = 1
        passwordTextFiled.layer.borderColor = UIColor.gray.cgColor
        passwordTextFiled.clearButtonMode = .always
        passwordTextFiled.isSecureTextEntry = true
        passwordTextFiled.keyboardType = .default
        scrollView.addSubview(passwordTextFiled)
        passwordTextFiled.delegate = self
        
        //パスワードの文字数
        let passCountLabel = UILabel()
        passCountLabel.frame = CGRect(x: view.frame.size.width - 180, y: 410, width: 150, height: 20)
        passCountLabel.text = "8~15文字の半角英数字"
        passCountLabel.textColor = UIColor.gray
        passCountLabel.font = UIFont.systemFont(ofSize: 12)
        scrollView.addSubview(passCountLabel)
        
        //利用規約
        let termsButton = UIButton(type: .system)
        //利用規約部分に下線を引く
        let terms = "利用規約"
        let underLineStringTerms = "\(terms)に同意する"
        let attributeString1 = NSMutableAttributedString(string: underLineStringTerms)
        attributeString1.addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue, .foregroundColor: colors.bluePurple], range: NSRange(location: 0, length: attributeString1.length - 5))
        termsButton.setAttributedTitle(attributeString1, for: .normal)
        termsButton.frame = CGRect(x: 60, y: view.frame.size.height - 350, width: 170, height: 20)
        termsButton.setTitleColor(UIColor.gray, for: .normal)
        termsButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        termsButton.addTarget(self, action: #selector(goTerms), for: .touchUpInside)
        scrollView.addSubview(termsButton)
        
        //プライバシーポリシー
        let privacyButton = UIButton(type: .system)
        //プライバシーポリシー部分に下線を引く
        let privacy = "プライバシーポリシー"
        let underLineStringPrivacy = "\(privacy)に同意する"
        let attributeString2 = NSMutableAttributedString(string: underLineStringPrivacy)
        attributeString2.addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue, .foregroundColor: colors.bluePurple], range: NSRange(location: 0, length: attributeString2.length - 5))
        privacyButton.setAttributedTitle(attributeString2, for: .normal)
        privacyButton.frame = CGRect(x: 60, y: view.frame.size.height - 315, width: 250, height: 20)
        privacyButton.setTitleColor(UIColor.gray, for: .normal)
        privacyButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        privacyButton.addTarget(self, action: #selector(goPrivacy), for: .touchUpInside)
        scrollView.addSubview(privacyButton)
        
        //登録ボタン
        let registerButton = UIButton()
        registerButton.frame = CGRect(x: 60, y: view.frame.size.height - 260, width: 250, height: 50)
        registerButton.setTitle("登録する", for: .normal)
        registerButton.backgroundColor = .systemGray4
        registerButton.layer.shadowOpacity = 0.5
        registerButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        registerButton.setTitleColor(colors.black, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        registerButton.addTarget(self, action: #selector(actionRegister), for: .touchUpInside)
        scrollView.addSubview(registerButton)
        
        //let gradientLayer1 = CAGradientLayer()
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = CGRect(x: 0, y: view.frame.height - 180, width: view.frame.size.width, height: 250)
        gradientLayer2.colors = [colors.yellowOrange.cgColor, colors.orange.cgColor,]
        gradientLayer2.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer2.endPoint = CGPoint.init(x: 1, y: 1)
        scrollView.layer.insertSublayer(gradientLayer2, at: 0)
        
        //トップページラベル
        let topPageLabelButton = UIButton(type: .system)
        topPageLabelButton.frame = CGRect(x: view.frame.size.width - 180, y: view.frame.size.height - 150, width: 100, height: 20)
        topPageLabelButton.setTitle("トップページ", for: .normal)
        topPageLabelButton.setTitleColor(colors.black, for: .normal)
        topPageLabelButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        topPageLabelButton.addTarget(self, action: #selector(goTopPage), for: .touchUpInside)
        scrollView.addSubview(topPageLabelButton)
        
        //ドライバー登録ラベルボタン
        let driverLabelButton = UIButton(type: .system)
        driverLabelButton.frame = CGRect(x: view.frame.size.width - 180, y: view.frame.size.height - 120, width: 100, height: 20)
        driverLabelButton.setTitle("ドライバー登録", for: .normal)
        driverLabelButton.setTitleColor(colors.black, for: .normal)
        driverLabelButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        scrollView.addSubview(driverLabelButton)
        
        //事業案内ラベルボタン
        let businessInformationButton = UIButton(type: .system)
        businessInformationButton.frame = CGRect(x: view.frame.size.width - 180, y: view.frame.size.height - 90, width: 100, height: 20)
        businessInformationButton.setTitle("事業案内", for: .normal)
        businessInformationButton.setTitleColor(colors.black, for: .normal)
        businessInformationButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        businessInformationButton.addTarget(self, action: #selector(goInformation), for: .touchUpInside)
        scrollView.addSubview(businessInformationButton)
        
        //利用規約ラベルボタン
        let termsLabelButton = UIButton(type: .system)
        termsLabelButton.frame = CGRect(x: view.frame.size.width - 180, y: view.frame.size.height - 60, width: 100, height: 20)
        termsLabelButton.setTitle("利用規約", for: .normal)
        termsLabelButton.setTitleColor(colors.black, for: .normal)
        termsLabelButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        termsLabelButton.addTarget(self, action: #selector(goTerms), for: .touchUpInside)
        scrollView.addSubview(termsLabelButton)
        
        //プライバシーポリシーラベルボタン
        let privacyLabelButton = UIButton(type: .system)
        privacyLabelButton.frame = CGRect(x: view.frame.size.width - 180, y: view.frame.size.height - 30, width: 100, height: 20)
        privacyLabelButton.setTitle("プライバシーポリシー", for: .normal)
        privacyLabelButton.setTitleColor(colors.black, for: .normal)
        privacyLabelButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        privacyLabelButton.addTarget(self, action: #selector(goPrivacy), for: .touchUpInside)
        scrollView.addSubview(termsLabelButton)
        
        //Adful
        let Adfullable1 = UILabel()
        Adfullable1.frame = CGRect(x: view.frame.size.width - 285, y: view.frame.size.height - 130, width: 70, height: 20)
        Adfullable1.text = "Adful"
        Adfullable1.textColor = colors.black
        Adfullable1.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        scrollView.addSubview(Adfullable1)
        
    }
    
    @objc func goAdful() {
        performSegue(withIdentifier: "goAdful", sender: nil)
    }
    
    //お問い合わせ画面へ
    @objc func goContact() {
        performSegue(withIdentifier: "goContact", sender: nil)
    }
    
    //利用規約画面へ
    @objc func goTerms() {
        dismiss(animated: true, completion: nil)
    }
    
    //プライバシーポリシー画面へ
    @objc func goPrivacy() {
        dismiss(animated: true, completion: nil)
    }
    
    //登録するボタンをタップ
    @objc func actionRegister() {
        print("registerButtonのタップ")
    }
    
    //トップページラベルボタンをタップ
    @objc func goTopPage() {
        print("topPageButtonタップ")
    }
    
    //事業案内画面へ
    @objc func goInformation() {
        print("事業案内へ")
    }
    
    //    //チェックボックスにチェックを入れたときの処理
    //    @objc func didTapRadioButton() {
    //        switch checked {
    //        case false:
    //            radioButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
    //            checked = true
    //        case true:
    //            radioButton.setImage(nil, for: .normal)
    //            checked = false
    //        }
    //    }
    
}

//MARK: - TextField Delegate
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //テキストフィールド内での文字数制限
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //文字数最大値を定義
        var maxLength: Int = 30

        switch (textField.tag) {
        case 1:
            maxLength = 30
        case 2:
            maxLength = 16
        default:
            break
        }
        // textField内の文字数
        let textFieldNumber = textField.text?.count ?? 0
        //入力された文字数
        let stringNumber = string.count

        return textFieldNumber + stringNumber <= maxLength
    }
}
