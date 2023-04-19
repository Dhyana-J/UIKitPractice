//
//  ViewController.swift
//  LoginUIWithoutStoryboard
//
//  Created by Kaala on 2023/03/23.
//

import UIKit

// Controller는 동작 관련 코드를 다룬다 하지만 유지보수 방식에 따라 뷰 역할을 같이 할 수도
// class는 table dispatch 때문에 클래스보다 느림. "final"로 상속을 못하게 막음으로써 direct dispatch가 일어나도록 한다. method를 찾는데 시간 허비 안함
final class ViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAddTarget()
    }
    
    func setUpAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func loginButtonTapped(_:UIButton){
        // 서버랑 통신해서 다음화면 넘어간다고 가정
        print("Login Button Tapped")
    }

    @objc func resetButtonTapped(){
        print(#function)
        let alertController = UIAlertController(title: "Reset Password", message: "do you want to reset password?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel", style: .default) { cancel in
            print("cancel button tapped")
        }
        let success = UIAlertAction(title: "confirm", style: .default) { action in
            print("confirm button tapped")
        }
        alertController.addAction(cancel)
        alertController.addAction(success)

        present(alertController, animated: true) {
            print("alert action completed")
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // first responder 다 제거한다. 키보드 내려갈 때 사용 가능
    }
    
}


