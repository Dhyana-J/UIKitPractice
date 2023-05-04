//
//  ViewController.swift
//  VC-Cycle
//
//  Created by Kaala on 2023/04/21.
//

//MARK: - ViewController LifeCycle
import UIKit

class ViewController: UIViewController {
    
    override func loadView() { // Code로 View 짰을 때만 사용
//        super.loadView() // 수퍼콜 필요없음
        print("VC-1 loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC-1 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC-1 viewWillAppear")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC-1 viewDidAppear")    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC-1 viewWillDisappear")    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC-1 viewDidDisappear")    }
    
    deinit {
        print("VC1 메모리에서 해제")
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") else {return}
//        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true)
    }
    
}

