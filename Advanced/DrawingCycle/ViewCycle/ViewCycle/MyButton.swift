//
//  MyButton.swift
//  ViewCycle
//
//  Created by Kaala on 2023/05/04.
//

import UIKit

final class MyButton: UIButton {
    
    var isOn:Bool = false
    
    var callCount = 0
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
    func toggle(){
        self.isOn.toggle()
    }
    
    /*
     // 이론적으로 1초에 60번이 함수 호출 Cycle (주사율 60hz기준)
     // Cycle 내에서 호출되는 함수들은 아래와 같음
     // updateConstraints -> layoutSubviews -> draw (text,image,color)
     // 필요에 따라 유연하게 호출할 수 있다
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
        print(callCount)
        callCount += 1 //60번 호출되지 않는다. 내부적으로 어떤 다른 과정이 있는듯
    }
    
    
}
