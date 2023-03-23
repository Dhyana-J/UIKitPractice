//
//  ViewController.swift
//  LoginUIWithoutStoryboard
//
//  Created by Kaala on 2023/03/23.
//

import UIKit

class ViewController: UIViewController {
//    We will create all UI components using code. This means we will not be using storyboards in this project

    let emailTextFieldView:UIView = { // Autolayout은 인스턴스가 메모리에 올라가는 순서 때문에 나중에 설정할 수 있다. lazy var 활용해 addSubView 가능
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }() // closure 활용해서 subView 설정코드를 변수 바로 옆에 둬서 가독성 높일 수 있음
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI(){
        let eView = emailTextFieldView
        view.addSubview(eView) // 뷰에 올리기만 하면 안됨, 오토레이아웃 잡아줘야
        eView.translatesAutoresizingMaskIntoConstraints = false // 자동으로 프레임 기준 오토레이아웃 잡아주는 기능 끈다. 항상 해줘야함
        eView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true //view 리딩앵커 기준 30 띄운다.
        eView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        eView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        eView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }


}

