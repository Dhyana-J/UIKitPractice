//
//  RpsManager.swift
//  RPSGame
//
//  Created by Kaala on 2023/04/14.
//

import UIKit

struct RPSManager {
    
    private var comChoice:Rps = Rps(rawValue: Int.random(in: 1...3))!
    private var userChoice:Rps = Rps(rawValue: Int.random(in: 1...3))!
    
    let readyState = Rps(rawValue: 0)!.rpsInfo
    
    mutating func setComChoice(){
        comChoice = Rps(rawValue: Int.random(in: 1...3))!
    }
    
    mutating func setUserChoice(choice:String){
        switch choice {
            case "바위": userChoice = Rps(rawValue:1)!
            case "보": userChoice = Rps(rawValue:2)!
            case "가위": userChoice = Rps(rawValue:3)!
            default: return
        }
    }
    
    func getUserChoiceImage()->UIImage?{
        return userChoice.rpsInfo.image
    }
    
    func getComChoiceImage()->UIImage?{
        return comChoice.rpsInfo.image
    }
    
    func getUserChoiceText()->String{
        return userChoice.rpsInfo.name
    }
    
    func getComChoiceText()->String{
        return comChoice.rpsInfo.name
    }
    
    
    func getRpsResult()->String{
        if userChoice == comChoice {
            return "DRAW"
        } else if (userChoice.rpsInfo.name == "가위" && comChoice.rpsInfo.name == "보") ||
                    (userChoice.rpsInfo.name == "바위" && comChoice.rpsInfo.name == "가위") ||
                    (userChoice.rpsInfo.name == "보" && comChoice.rpsInfo.name == "바위") { return "WIN"}
        else { return "LOSE" }
    }
    
    
    
}
