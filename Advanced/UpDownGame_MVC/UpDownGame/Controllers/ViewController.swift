//
//  ViewController.swift
//  UpDownGame
//
//  Created by Kaala on 2023/02/01.
//

import UIKit


final class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    
    private var upDownManager = UpDownManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light // dark mode일 때 레이블 안보이는 문제 방지
        resetGameUI()
    }
    
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        resetNumberButtonsColor()
        sender.backgroundColor = #colorLiteral(red: 0.6216478944, green: 0.79280442, blue: 0.6696482301, alpha: 1)
        numberLabel.text = sender.currentTitle
    }
    
    
    private func resetNumberButtonsColor(){
        numberButtons.forEach { button in
            button.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.5098039216, blue: 0.4117647059, alpha: 1)
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetNumberButtonsColor()
        resetGameUI()
        upDownManager.resetGameStatus()
    }
    
    private func resetGameUI(){
        mainLabel.text = "숫자를 선택하세요"
        numberLabel.text = "?"
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        guard let userChoiceNumber = Int(numberLabel.text!) else {return}
        if upDownManager.getPreviousChoice() != userChoiceNumber { //똑같은 숫자로 재시도하면 아무것도 안함
            upDownManager.setTryCountUp(userChoiceNumber: userChoiceNumber)
            upDownManager.setPreviousChoice(userChoiceNumber: userChoiceNumber)
            setGameResultUI(userChoiceNumber: userChoiceNumber)
        }
    }
    
    
    private func setGameResultUI(userChoiceNumber:Int){
        let result = upDownManager.getGameResultInfo(userChoiceNumber: userChoiceNumber)
        let isBingo:Bool = result.bingoText != nil ? true : false
        
        mainLabel.text = result.resultText
        if isBingo { numberLabel.text = result.bingoText }
        
    }
    
    
    
    
}

