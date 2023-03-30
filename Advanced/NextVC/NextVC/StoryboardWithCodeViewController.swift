//
//  SecondViewController.swift
//  NextVC
//
//  Created by Kaala on 2023/03/28.
//

import UIKit

class StoryboardWithCodeViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var someString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        mainLabel.font = .systemFont(ofSize: 30)
        mainLabel.text = someString
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
