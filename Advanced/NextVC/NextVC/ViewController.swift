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
        
        let codeNextVC = CodeNextViewController()
        codeNextVC.modalPresentationStyle = .fullScreen
//        codeNextVC.mainLabel.text = "Kia" // ERROR : viewDidLoad 이전 접근으로 nil
        codeNextVC.someString = "Apple" // 메모리에 VC가 올라갈 때 부터 존재하는 변수를 활용해서 오류를 방지할 수 있다
        self.present(codeNextVC, animated: true)
    }
    
    // 2. 코드를 통해 스토리보드 객체 생성해서 화면 이동
    @IBAction func storyboardWithCodeBtnTapped(_ sender: UIButton) {
        print(#function)
        
        guard let storyboardWithCodeVC = storyboard?.instantiateViewController(withIdentifier: "storyboardWithCodeVC") as? StoryboardWithCodeViewController else {return}
//        storyboardWithCodeVC.mainLabel.text = "Hyundai" //Error. 스토리보드와 뷰컨이 연결되기 전에 호출되어 nil
        storyboardWithCodeVC.someString = "Tesla"
        storyboardWithCodeVC.modalPresentationStyle = .fullScreen
        storyboardWithCodeVC.modalTransitionStyle = .crossDissolve
        self.present(storyboardWithCodeVC, animated: true)
        
    }
    
    // 3. 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueBtnTapped(_ sender: UIButton) {
        print(#function)
        performSegue(withIdentifier: "toWithSegueVC", sender: self) // 간접 세그웨이의 경우에만 호출해줘야함
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "toWithSegueVC":
                guard let storyboardWithSegueVC = segue.destination as? StoryboardWithSegueViewController else {return}
                storyboardWithSegueVC.someString = "Twitter"
                storyboardWithSegueVC.modalPresentationStyle = .fullScreen
                storyboardWithSegueVC.modalTransitionStyle = .flipHorizontal
            case "toWithDirectSegueVC":
                guard let storyboardWithDirectSegueVC = segue.destination as? StoryboardWithDirectSegueViewController else {return}
                storyboardWithDirectSegueVC.someString = "Palantir"
                storyboardWithDirectSegueVC.modalPresentationStyle = .fullScreen
                storyboardWithDirectSegueVC.modalTransitionStyle = .partialCurl
            default:return
        }
    }
    
    // 4. 직접 세그웨이인 경우에만(Action 요소에 세그웨이 직접 연결) 실행되는 메소드
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(identifier)
        return identifier == "" ? false : true
    }
    
    

}

