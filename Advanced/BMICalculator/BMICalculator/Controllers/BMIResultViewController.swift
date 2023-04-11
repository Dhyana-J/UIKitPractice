//
//  BMIResultViewController.swift
//  BMICalculator
//
//  Created by Kaala on 2023/03/31.
//

import UIKit

final class BMIResultViewController: UIViewController {

    
    @IBOutlet weak var bmiValueLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var bmiStatus:BMI?
    
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

        guard let bmiStatus else {return}
        bmiValueLabel.backgroundColor = bmiStatus.matchColor
        bmiValueLabel.text = String(bmiStatus.value)
        adviceLabel.text = bmiStatus.adviceString
    }
    
    
    @IBAction func restartBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

    


}
