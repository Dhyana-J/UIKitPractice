//
//  UpDownManager.swift
//  UpDownGame
//
//  Created by Kaala on 2023/04/14.
//

import UIKit

struct UpDownManager {
    
    private var bingoNumber:Int =  Int.random(in: 1...10)
    private var tryCount = 0
    private var previousChoice = 0
    
    
    func getPreviousChoice()->Int {
        return previousChoice
    }
    
    func getBingoNumber()->Int {
        return bingoNumber
    }
    
    mutating func resetGameStatus() {
        tryCount = 0
        previousChoice = 0
        bingoNumber = Int.random(in: 1...10)
    }
    
    mutating func setTryCountUp(userChoiceNumber:Int){
        tryCount += 1
    }
    
    mutating func setPreviousChoice(userChoiceNumber:Int){
        previousChoice = userChoiceNumber
    }
    
    mutating func getGameResultInfo(userChoiceNumber:Int)->(resultText:String,tryCount:Int?){
        
        if userChoiceNumber == bingoNumber {
            let currentTryCount = tryCount
            tryCount = 0
            return ("Bingo🐣",currentTryCount)
        } else if userChoiceNumber > bingoNumber {
            return ("Down",nil)
        }
        else {
            return ("Up",nil)
        }
    }
    
    
    
    
    
}
