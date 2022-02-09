//
//  SuccessViewController.swift
//  copyProject
//
//  Created by 홍성표 on 2022/02/09.
//

import UIKit

class SuccessViewController : UIViewController
{
    
    @IBOutlet weak var welcomLabel: UILabel!
    
    override func viewDidLoad() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    @IBAction func logoutTapped(_ sender: Any) {
    
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}
 
