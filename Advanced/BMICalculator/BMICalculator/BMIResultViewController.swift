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
        bmiValueLabel.backgroundColor = getBackgroundColor()
        bmiValueLabel.text = String(bmi)
        adviceLabel.text = getBMIAdviceString()
    }
    
    
    @IBAction func restartBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
            case ..<18.6:
                return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
            case 18.6..<23.0:
                return UIColor (displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
            case 23.0..<25.0:
                return UIColor (displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
            case 25.0..<30.0:
                return UIColor (displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
            case 30.0...:
                return UIColor (displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
            default:
                return UIColor.black
        }
    }
    
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
            case ..<18.6:
                return "저체중"
            case 18.6..<23.0:
                return "표준"
            case 23.0..<25.0:
                return "과체중"
            case 25.0..<30.0:
                return "중도비만"
            case 30.0...:
                return "고도비만"
            default:
                return ""
        }
    }

    


}
