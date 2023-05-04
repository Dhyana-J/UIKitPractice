//
//  MyButton.swift
//  ViewCycleCustomView
//
//  Created by Kaala on 2023/05/04.
//

import UIKit

final class MyButton:UIButton {
    
    // 버튼 내부에 AutoLayout 잡아야 할 경우 구현
    override func updateConstraints() {
        
        // 구현 코드 작성
        
        //Call [super updateConstraints] as the final step in your implementation.
        super.updateConstraints()
    }
    
    
    // 현재 화면크기 기준으로 프레임이 잡힌다. (버튼의 프레임도 결정되는 곳)
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.layer.cornerRadius = self.frame.width / 2
//        // 위 코드를 updateConstraints에 넣으면 안돼?
//        // -> 프레임도 안잡힌 시점에 넣는 것이라 무의미
//    }
    
    // 내부 컨텐츠 그리는 곳
    // ex) draw 메서드 내부에 별모양 같은거 구현하는 코드 작성할 수 있음
    //    override func draw(_ rect: CGRect) {
    //        <#code#>
    //    }
    
}
