//
//  ViewController.swift
//  DiceGame
//
//  Created by Kaala on 2023/01/19.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let diceImageSet:[UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    private func extractRandomDice() -> UIImage? {
        return diceImageSet.randomElement()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        firstDice.image = extractRandomDice()
        secondDice.image = extractRandomDice()
    }
    
    
    
}

