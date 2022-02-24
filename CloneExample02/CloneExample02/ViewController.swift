//
//  ViewController.swift
//  CloneExample02
//
//  Created by test on 2022/02/15.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBAction func btnClicked(_ sender: UIButton) {
        
        // Main 스토리보드 생성
        var storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        // if let은 해당 조건에 nil여부 체크(nil일경우 if, 아닐경우 else)
        if let secondVC = storyBoard.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            
            // delegate를사용하여 second에 이벤트발생을 수신
            secondVC.secondDelegate = self
            self.present(secondVC, animated: true, completion: nil)
        }
    }
    
    func passText(text: String) {
        print("text = \(text)")
        labelText.text = text
    }
}

