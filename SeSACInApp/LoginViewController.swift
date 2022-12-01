//
//  LoginViewController.swift
//  SeSACInApp
//
//  Created by 박관규 on 2022/11/29.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_check: UITextField!
    
    @IBOutlet weak var descriptionlabel: UILabel!
    
    var user = User(email: "", password: "", check: "")
    var validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(#function)
        descriptionlabel.accessibilityIdentifier = "descriptionLabel"
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        descriptionlabel.text = "로그인 버튼 클릭"
        
        user = User(email: tf_email.text!, password: tf_password.text!, check: tf_check.text!)
        
        if validator.isVaidEmail(email: user.email) && validator.isValidPassword(password: user.password) && validator.isEqualPassword(password: user.password, check: user.check) {
            print("로그인 성공")
        }else {
            print("로그인 실패")
        }
    }
}

final class Validator {
    
    internal func isVaidEmail(email: String) -> Bool {
        return email.contains("@") && email.count >= 8
    }
    
    internal func isValidPassword(password: String) -> Bool {
        return password.count >= 6 && password.count < 12
    }
    
    internal func isEqualPassword(password: String, check: String) -> Bool {
        return password == check
    }
    
}

struct User {
    let email: String
    let password: String
    let check: String
}
