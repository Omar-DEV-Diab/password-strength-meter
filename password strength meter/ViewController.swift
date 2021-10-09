//
//  ViewController.swift
//  password strength meter
//
//  Created by Omar Diab on 9/17/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var strenghtnesContainer: StrengthMeterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        passwordField.returnKeyType = .done
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        strenghtnesContainer.checkPasswordStrength(textField.text)
    }
}

