//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Kaala on 2023/01/15.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    private func toggleText(){
        if self.titleLabel.text == "안녕하세요" {
            self.titleLabel.text = "반갑습니다"
        } else {
            self.titleLabel.text = "안녕하세요"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "안녕하세요"
//        titleLabel.backgroundColor = UIColor.brown
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        toggleText()
    }
    


}

