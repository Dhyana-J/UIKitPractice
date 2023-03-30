//
//  StoryboardWithDirectSegueViewController.swift
//  NextVC
//
//  Created by Kaala on 2023/03/29.
//

import UIKit

class StoryboardWithDirectSegueViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var someString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        mainLabel.font = .systemFont(ofSize: 25)
        mainLabel.text = someString
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    

}
