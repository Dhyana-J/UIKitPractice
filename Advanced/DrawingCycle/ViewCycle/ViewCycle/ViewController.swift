//
//  ViewController.swift
//  ViewCycle
//
//  Created by Kaala on 2023/05/04.
//

import UIKit

final class ViewController: UIViewController {
    
    // Variables for Constraints
    private var btnHeightAnchor:NSLayoutConstraint!
    private var btnWidthAnchor:NSLayoutConstraint!
    
    // Button
    private lazy var myButton:MyButton = {
        let btn = MyButton()
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .yellow
        btn.setTitle("Button", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(handleAnimationEffect), for: .touchUpInside)
        btn.isOn = false
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }
    
    func setupUI(){
        view.addSubview(myButton)
    }
    
    func setConstraints(){
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        // save constraints to variables
        btnHeightAnchor = myButton.heightAnchor.constraint(equalToConstant: 60)
        btnWidthAnchor = myButton.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            btnHeightAnchor,
            btnWidthAnchor,
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
        
    
    
    @objc func handleAnimationEffect(){
        print(#function)
        
        btnHeightAnchor.constant = myButton.isOn ? 60 : 400
        btnWidthAnchor.constant = myButton.isOn ? 100 : 200
        
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded() //layoutSubviews를 2초동안 호출시킨다
        } completion: { isSuccess in
            if isSuccess {
                print("애니메이션 완료")
            }
        }
        
        myButton.toggle()
        
        
    }


}

