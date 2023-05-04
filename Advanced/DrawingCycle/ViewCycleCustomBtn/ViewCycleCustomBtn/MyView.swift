//
//  MyView.swift
//  ViewCycleCustomBtn
//
//  Created by Kaala on 2023/05/04.
//

import UIKit

final class MyView: UIView {
    
    var isOn:Bool = false
    
    lazy var myButton:UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .blue
        btn.setTitle("Touch", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    func toggle(){
        self.isOn.toggle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(myButton)
//        myButton.translatesAutoresizingMaskIntoConstraints = false // updateConstraints() 구현할 때 적용
    }
    
    //생성자 재정의할 때 필수생성자도 반드시 구현해야
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
        프레임 설정 이전에 오토레이아웃 관련 코드가 먼저 호출된다
     */
    
    //set Button width and height using autolayout
//    override func updateConstraints() {
//        print(#function)
//
//        NSLayoutConstraint.activate([
//            myButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
//            myButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
//            myButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            myButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//        ])
//
//        super.updateConstraints()
//    }
    
    //set Button width and height using frame
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)

        myButton.frame.size = CGSize(width: self.frame.size.width/2, height: self.frame.size.height/2)
        myButton.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
}
