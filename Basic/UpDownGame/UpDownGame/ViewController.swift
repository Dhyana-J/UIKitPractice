//
//  ViewController.swift
//  UpDownGame
//
//  Created by Kaala on 2023/02/01.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    private var bingoNumber:Int =  Int.random(in: 1...10)
    
    private var tryCount = 0
    private var previousChoice = 0
    
    @IBOutlet var numberButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light // dark mode일 때 레이블 안보이는 문제 방지
        resetGameUI()
    }
    
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        resetButtonsColor()
        sender.backgroundColor = #colorLiteral(red: 0.6216478944, green: 0.79280442, blue: 0.6696482301, alpha: 1)
        numberLabel.text = sender.currentTitle
    }
    
    
    private func resetButtonsColor(){
        numberButtons.forEach { button in
            button.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.5098039216, blue: 0.4117647059, alpha: 1)
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetButtonsColor()
        resetGameUI()
        previousChoice = 0
        tryCount = 0
    }
    
    private func resetGameUI(){
        mainLabel.text = "숫자를 선택하세요"
        numberLabel.text = "?"
        bingoNumber = Int.random(in: 1...10)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        guard let userChoiceNumber = Int(numberLabel.text!) else {return}
        if previousChoice != userChoiceNumber { //똑같은 숫자로 재시도하면 아무것도 안함
            tryCount += 1
            previousChoice = userChoiceNumber
            getGameResult(userChoiceNumber: userChoiceNumber)
        }
    }
    
    
    private func getGameResult(userChoiceNumber:Int){
        if userChoiceNumber == bingoNumber {
            mainLabel.text = "Bingo🐣"
            numberLabel.text = "\(tryCount)번 만에 맞췄어요😸"
            tryCount = 0
        } else if userChoiceNumber > bingoNumber { mainLabel.text = "Down" }
        else { mainLabel.text = "Up" }
    }
    
    
    
    
}

