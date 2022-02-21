//
//  EnterEmailViewController.swift
//  copyProject
//
//  Created by 홍성표 on 2022/02/09.
//

import UIKit
import FirebaseAuth
class EnterEmailViewController :UIViewController
{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        LoginButton.layer.cornerRadius = 30
        LoginButton.layer.borderColor = UIColor.black.cgColor
        LoginButton.layer.borderWidth = 1
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func LoginButtonTapped(_ sender: UIButton)
    {

        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        Auth.auth().createUser(withEmail: email, password: password) {
            [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error
            {
                let code = (error as NSError).code
                switch code {
                case 17007 :
                    self.loginUser(withEmail: email, password: password)
                default:
                    self.errorMessageLabel.text = error.localizedDescription
                }
            }
            else
            {
                self.showMainViewController()
            }
        }
    }


    private func showMainViewController()
    {
        let UIboard = UIStoryboard(name: "Hong", bundle: Bundle.main)
        let MainviewStoryBoard = UIboard.instantiateViewController(identifier:"SuccessViewController")

        MainviewStoryBoard.modalPresentationStyle = .fullScreen
        navigationController?.show(MainviewStoryBoard, sender: nil)
    }
    
    private func loginUser(withEmail Email : String , password : String)
    {
        
        Auth.auth().signIn(withEmail: Email, password: password) {[weak self] _ , error in
            
            guard let self = self else { return }
            
            if let error = error
            {
                self.errorMessageLabel.text = error.localizedDescription
            }else
            {
                self.showMainViewController()
            }
        
        }
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
