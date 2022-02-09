//
//  LoginViewController.swift
//  copyProject
//
//  Created by 홍성표 on 2022/02/09.
//

import UIKit

class LonginViewController : UIViewController
{
   
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.black.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
            
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
 
}

