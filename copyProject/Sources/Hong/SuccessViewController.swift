//
//  SuccessViewController.swift
//  copyProject
//
//  Created by 홍성표 on 2022/02/09.
//

import UIKit
import FirebaseAuth

class SuccessViewController : UIViewController
{
    
    @IBOutlet weak var welcomLabel: UILabel!
    
    override func viewDidLoad() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ??  "고객"
        
        welcomLabel.text = """
        환영합니다
        \(email)님
        """
    }
    @IBAction func logoutTapped(_ sender: Any) {
        
        let authFrieBase = Auth.auth()
        
        do {
            try authFrieBase.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError  as NSError{
            
            print("Error Message : \(signOutError.localizedDescription)")
            
        }
    
        
        
    }
}
 
