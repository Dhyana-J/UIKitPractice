//
//  ViewController.swift
//  ViewCycleCustomView
//
//  Created by Kaala on 2023/05/04.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var myButton:MyButton = {
        let btn = MyButton()
        btn.backgroundColor = .yellow
        btn.setTitle("Button", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(handleButtonAction), for:.touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // ViewController에서 frame이 결정되는 곳이라 여기서도 조정이 가능하다.
    // MyButton의 layoutSubViews() 이후 호출됨
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.myButton.layer.cornerRadius = self.myButton.frame.width / 2
    }
    
    
    func setupUI() {
        view.addSubview(myButton)
    }
    
    func setupConstraints() {
        myButton.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            myButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            myButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // 높이를 넓이 기준으로 1:1로 설정하는 오토레이아웃 코드(multiplier)
            myButton.heightAnchor.constraint(equalTo: myButton.widthAnchor, multiplier: 1)
        ])
        
    }
    
    @objc func handleButtonAction(){
        print(#function)
    }


}

