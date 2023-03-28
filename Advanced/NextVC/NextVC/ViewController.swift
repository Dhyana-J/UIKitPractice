//
//  ViewController.swift
//  NextVC
//
//  Created by Kaala on 2023/03/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1. 코드로 화면 이동 (다음 화면이 코드로 작성되어있어야 함)
    @IBAction func codeNextBtnTapped(_ sender: UIButton) {
        print(#function)
        let firstVC = FirstViewController()
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.someString = "뚜뚜루뚜뚜루"
        self.present(firstVC, animated: true)
    }
    
    // 2. 코드를 통해 스토리보드 객체 생성해서 화면 이동
    @IBAction func storyBoardWithCodeBtnTapped(_ sender: UIButton) {
        print(#function)

    }
    
    // 3. 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyBoardWithSegueBtnTapped(_ sender: UIButton) {
        print(#function)

    }
    
    

}

