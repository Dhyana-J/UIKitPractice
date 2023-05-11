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
        // Tab Bar Controller
        let tabBarVC = UITabBarController()
        
        // 첫 번째 화면은 NavigationController로 만든다
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        let vc5 = FifthViewController()
        
        // Tab Bar 이름 설정
        vc1.title = "RED"
        vc2.title = "ORANGE"
        vc3.title = "YELLOW"
        vc4.title = "GREEN"
        vc5.title = "BLUE"
        
        // Tab Bar로 사용하기 위한 ViewController 설정
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        
        // Tab Bar Image 설정
        guard let items = tabBarVC.tabBar.items else { return }
        
        let imageNameArray:[String] = ["square.and.arrow.up","folder","paperplane","doc","note"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: imageNameArray[i])
        }
        
        present(tabBarVC,animated: true)
        
    }
}
