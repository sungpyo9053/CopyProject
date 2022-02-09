//
//  EnterEmailViewController.swift
//  copyProject
//
//  Created by 홍성표 on 2022/02/09.
//

import UIKit

class EnterEmailViewController :UIViewController
{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginButton.layer.cornerRadius = 30
        LoginButton.isEnabled = false
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = false
//        //navigationController.navigationBar.isHidden = false
//    }
    
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
    }
}

extension EnterEmailViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let emailEmpty = emailTextField.text == ""
        let passwordEmpty = passwordTextField.text == ""
        LoginButton.isEnabled = !emailEmpty && !passwordEmpty
        
        
    }
    
    
    
}
