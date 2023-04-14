//
//  ViewController.swift
//  RPSGame
//
//  Created by Kaala on 2023/01/27.
//

import UIKit

final class ViewController: UIViewController {
    
    
    //Properties
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var userChoiceLabel: UILabel!
    
    @IBOutlet var rpsBtns: [UIButton]!
    
    var rpsManager = RPSManager()
    
    
    //Methods
    override func viewDidLoad() { // 앱의 화면에 들어오면 처음 실행되는 함수
        super.viewDidLoad()
        setInitialGameState()
    }
    
    
    @IBAction func rpsBtnTapped(_ sender: UIButton) {
        resetRpsBtnColor()
        
        rpsManager.setUserChoice(choice: sender.currentTitle!)
        
        sender.backgroundColor = #colorLiteral(red: 0.7549748421, green: 1, blue: 0.8084700108, alpha: 1)
        sender.setTitleColor(.black, for: .normal)
    }
    
    
    private func resetRpsBtnColor() {
        rpsBtns.forEach { btn in
            btn.backgroundColor = #colorLiteral(red: 0.2066814005, green: 0.7795598507, blue: 0.349144876, alpha: 1)
            btn.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func selectBtnTapped(_ sender: UIButton) {
        rpsManager.setComChoice()
        setUserImageView(image:rpsManager.getUserChoiceImage())
        setUserChoiceLabel(text: rpsManager.getUserChoiceText())
        setComImageView(image: rpsManager.getComChoiceImage())
        setComChoiceLabel(text: rpsManager.getComChoiceText())
        mainLabel.text = rpsManager.getRpsResult()
    }
    
    func setUserImageView(image:UIImage?){
        userImageView.image = image
    }
    
    func setUserChoiceLabel(text:String?){
        userChoiceLabel.text = text
    }
    
    func setComImageView(image:UIImage?){
        comImageView.image = image
    }
    
    func setComChoiceLabel(text:String?){
        comChoiceLabel.text = text
    }
    
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        resetRpsBtnColor()
        setInitialGameState()
    }
    
    private func setInitialGameState(){
        
        let readyLabel = rpsManager.readyState.name
        let readyImage = rpsManager.readyState.image
        
        [comChoiceLabel,userChoiceLabel].forEach {$0.text = readyLabel}
        [comImageView,userImageView].forEach{$0.image = readyImage}
        
        mainLabel.text = "READY"
    }
    
    
}

