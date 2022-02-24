//
//  SecondViewController.swift
//  CloneExample02
//
//  Created by test on 2022/02/15.
//

import UIKit

protocol SecondViewControllerDelegate {
    func passText(text: String)
}

class SecondViewController: UIViewController {
    
    var secondDelegate: SecondViewControllerDelegate?
    var textField = ""
    
    @IBAction func editChanged(_ sender: UITextField) {
        self.textField = sender.text ?? ""
        // 이벤트 발생시 passText로 데이터 송출
        self.secondDelegate?.passText(text: textField)
    }
    
    @IBAction func backBtnCliecked(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("화면사라짐")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
