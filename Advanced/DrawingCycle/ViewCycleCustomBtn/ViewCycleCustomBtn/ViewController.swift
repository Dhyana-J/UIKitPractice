//
//  ViewController.swift
//  ViewCycleCustomBtn
//
//  Created by Kaala on 2023/05/04.
//

import UIKit

final class ViewController: UIViewController {
    
    private var myViewHeightAnchor:NSLayoutConstraint!
    private var myViewWidthAnchor:NSLayoutConstraint!
    
    private lazy var myView:MyView = {
        let btn = MyView()
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .yellow
        btn.isOn = false
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    func setupUI(){
        view.addSubview(myView)
        myView.myButton.addTarget(self, action: #selector(handleAnimationEffect), for: .touchUpInside)
    }
    
    func setupConstraints(){
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        // 제약조건을 변수에 저장
        myViewHeightAnchor = myView.heightAnchor.constraint(equalToConstant: 120)
        myViewWidthAnchor = myView.widthAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([
            myViewHeightAnchor,
            myViewWidthAnchor,
            
            // 원칙적인 오토레이아웃 설정 (가운데 정렬 - X, Y축)
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func handleAnimationEffect(){
        print(#function)
        
        myViewHeightAnchor.constant = myView.isOn ? 120 : 400
        myViewWidthAnchor.constant = myView.isOn ? 150 : 300
        
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        } completion: { isSuccess in
            if isSuccess {
                print("애니메이션 처리 완료")
            }
        }
        
        myView.toggle()
    }
    
    
}

