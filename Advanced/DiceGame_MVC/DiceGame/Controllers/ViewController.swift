//
//  ViewController.swift
//  DiceGame
//
//  Created by Kaala on 2023/01/19.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    
    let diceManager = DiceManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        [
            firstDice,
            secondDice
        ].forEach { $0.image = diceManager.getFirstDice() }
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        [
            firstDice,
            secondDice
        ] .forEach {$0.image = diceManager.extractRandomDice()}
    }
    
    
    
}

