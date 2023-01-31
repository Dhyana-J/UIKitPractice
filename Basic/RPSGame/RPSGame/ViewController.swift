//
//  ViewController.swift
//  RPSGame
//
//  Created by Kaala on 2023/01/27.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Properties
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var userChoiceLabel: UILabel!
    
    @IBOutlet var rpsBtns: [UIButton]!
    
    // enum 미적용 코드
//    private var selectedBtnTitle:String?
//    private let rpsDictionary:[String:UIImage] = ["가위": #imageLiteral(resourceName: "scissors") ,"바위": UIImage(named: "rock.png")! , "보": #imageLiteral(resourceName: "paper")]
    
    // enum 적용
    private var comChoice:Rps = Rps(rawValue: Int.random(in: 1...2))!
    private var userChoice:Rps = Rps(rawValue: Int.random(in: 1...2))!
    private let rpsDictionaryWithEnum:[Rps:UIImage] = [.scissors: #imageLiteral(resourceName: "scissors") ,.rock: UIImage(named: "rock.png")! , .paper: #imageLiteral(resourceName: "paper")]
    
    
    //Methods
    override func viewDidLoad() { // 앱의 화면에 들어오면 처음 실행되는 함수
        super.viewDidLoad()
        setInitialGameState()
    }
    
    
    @IBAction func rpsBtnTapped(_ sender: UIButton) {
        resetRpsBtnColor()
//        selectedBtnTitle = sender.currentTitle
        
        //enum 적용
        setUserChoiceWithEnum(choice: sender.currentTitle!)
        
        sender.backgroundColor = #colorLiteral(red: 0.7549748421, green: 1, blue: 0.8084700108, alpha: 1)
        sender.setTitleColor(.black, for: .normal)
        
    }
    
    
    //enum 적용
    private func setUserChoiceWithEnum(choice:String){
        switch choice{
            case "가위": userChoice = Rps(rawValue:2)!
            case "바위": userChoice = Rps(rawValue:0)!
            case "보": userChoice = Rps(rawValue:1)!
            default: return
        }
    }
    
    
    private func resetRpsBtnColor() {
        rpsBtns.forEach { btn in
            btn.backgroundColor = #colorLiteral(red: 0.2066814005, green: 0.7795598507, blue: 0.349144876, alpha: 1)
            btn.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func selectBtnTapped(_ sender: UIButton) {
        //enum 미적용 코드
//        guard let selectedBtnTitle else { return } // prevent nil error
//        setUserImageView(image:rpsDictionary[selectedBtnTitle])
//        setUserChoiceLabel(text: selectedBtnTitle)
//        let randomRps = rpsDictionary.keys.randomElement()!
//        setComImageView(image: rpsDictionary[randomRps])
//        setComChoiceLabel(text: randomRps)
//        mainLabel.text = getRpsResult(userChoice: selectedBtnTitle, comChoice: randomRps)
        
        
        //enum 적용
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        setUserImageView(image:rpsDictionaryWithEnum[userChoice])
        setUserChoiceLabel(text: userChoice.description)
        setComImageView(image: rpsDictionaryWithEnum[comChoice])
        setComChoiceLabel(text: comChoice.description)
        mainLabel.text = getRpsResult(userChoice: userChoice.description, comChoice: comChoice.description)
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
        comChoiceLabel.text = "Ready"
        userChoiceLabel.text = "Ready"
        
        comImageView.image = #imageLiteral(resourceName: "ready")
        userImageView.image = #imageLiteral(resourceName: "ready")
        
        mainLabel.text = "READY"
    }
    
    
    private func getRpsResult(userChoice:String, comChoice:String)->String{
        if userChoice == comChoice {
            return "DRAW"
        } else if (userChoice == "가위" && comChoice == "보") ||
                    (userChoice == "바위" && comChoice == "가위") ||
                    (userChoice == "보" && comChoice == "바위") { return "WIN"}
        else { return "LOSE" }
    }
    
}

