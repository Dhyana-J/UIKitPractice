//
//  BMICalculatorManager.swift
//  BMICalculator
//
//  Created by Kaala on 2023/04/09.
//

import Foundation
import UIKit

// BMI 계산 인스턴스
struct BMICalculatorManager {
    
    private var bmiStatus:BMI?
    
    mutating func getBMI(height:String,weight:String)->BMI{
        calculateBMI(height:height,weight:weight)
        return bmiStatus ?? BMI(value: 0.0, adviceString: "Error", matchColor: .white)
    }
    
    // BMI = kg/(m*m)
    mutating func calculateBMI(height:String,weight:String){
        guard let h = Double(height), let w = Double(weight) else {
            bmiStatus = BMI(value: 0.0, adviceString: "Error", matchColor: .white)
            return
        }
        var bmi = w/pow(h/100,2) // kg/(m*m)
        bmi = round(bmi*10)/10 // 반올림해 소수점 첫째자리까지 표기
        
        switch bmi {
            case ..<18.6:
                let color =  UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
                bmiStatus = BMI(value: bmi, adviceString: "저체중", matchColor: color)
            case 18.6..<23.0:
                let color =  UIColor (displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
                bmiStatus = BMI(value: bmi, adviceString: "표준", matchColor: color)
            case 23.0..<25.0:
                let color =  UIColor (displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
                bmiStatus = BMI(value: bmi, adviceString: "과체중", matchColor: color)
            case 25.0..<30.0:
                let color =  UIColor (displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
                bmiStatus = BMI(value: bmi, adviceString: "중도비만", matchColor: color)
            case 30.0...:
                let color =  UIColor (displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
                bmiStatus = BMI(value: bmi, adviceString: "고도비만", matchColor: color)
            default:
                let color =  UIColor.black
                bmiStatus = BMI(value: bmi, adviceString: "", matchColor: color)
        }
        
        
    }
    
}
