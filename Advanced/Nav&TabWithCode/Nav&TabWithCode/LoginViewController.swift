//
//  LoginViewController.swift
//  Nav&TabWithCode
//
//  Created by Kaala on 2023/05/09.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // login button
    private lazy var loginButton:UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .blue
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    // button autoLayout
    private func makeUI(){
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func loginButtonTapped(){
        
        // 이전 화면의 isLoggedIn 속성에 접근하기
        if let presentingVC = presentingViewController {
            let tabBarCon = presentingVC as! UITabBarController // 탭바에 접근하기
            let nav = tabBarCon.viewControllers?[0] as! UINavigationController // 네비게이션 바에 접근
            let firstVC = nav.viewControllers[0] as! FirstViewController // FirstVC에 접근
            firstVC.isLoggedIn.toggle()
        }
        dismiss(animated: true)
    }
}
