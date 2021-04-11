//
//  DismissKeyboard.swift
//  AdFul
//
//  Created by Takumi Fuzawa on 2021/04/07.
//

import UIKit


extension UIViewController {
    
    //キーボードを他の場所タップで閉じる
    func setDismissKeyboard() {
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
