//
//  BMIResultViewController.swift
//  BMICalculator
//
//  Created by Kaala on 2023/03/31.
//

import UIKit

class BMIResultViewController: UIViewController {

    
    @IBOutlet weak var bmiValueLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    var bmi:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        restartButton.clipsToBounds = true
        restartButton.layer.cornerRadius = 10
        
        bmiValueLabel.clipsToBounds = true
        bmiValueLabel.layer.cornerRadius = 13
        bmiValueLabel.backgroundColor = .gray
        
        guard let bmi else {return}
        bmiValueLabel.text = String(bmi)
    }
    
    
    @IBAction func restartBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    


}
