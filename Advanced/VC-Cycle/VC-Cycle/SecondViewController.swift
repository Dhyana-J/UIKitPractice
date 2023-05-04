//
//  SecondViewController.swift
//  VC-Cycle
//
//  Created by Kaala on 2023/04/21.
//

import UIKit

class SecondViewController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("===VC-2 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("===VC-2 viewWillAppear")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("===VC-2 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("===VC-2 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("===VC-2 viewDidDisappear")
    }
    
    deinit {
        print("===VC2 메모리에서 해제")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
