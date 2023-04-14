//
//  DiceManager.swift
//  DiceGame
//
//  Created by Kaala on 2023/04/13.
//

import UIKit

struct DiceManager {
    
    private let diceImageSet:[UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    func getFirstDice() -> UIImage {
        return diceImageSet.first!
    }
    
    func extractRandomDice() -> UIImage {
        return diceImageSet.randomElement()!
    }
    
}
