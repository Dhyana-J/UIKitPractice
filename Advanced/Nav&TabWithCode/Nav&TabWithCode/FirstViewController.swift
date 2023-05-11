//
//  ViewController.swift
//  Nav&TabWithCode
//
//  Created by Kaala on 2023/05/09.
//

import UIKit

final class FirstViewController: UIViewController {
    
    // login 여부 저장
    var isLoggedIn = false
    
//    var navigationController: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        
//        if !isLoggedIn {
//            let vc = LoginViewController()
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true)
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if !isLoggedIn {
//            let vc = LoginViewController()
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true)
//        }
    }
    
    private func makeUI(){
        view.backgroundColor = .red
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명으로 설정
//        appearance.backgroundColor = .brown // 색상 설정
//        appearance.configureWithTransparentBackground() / 투명으로 설정
        
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance

        title = "Main"

    }


}

