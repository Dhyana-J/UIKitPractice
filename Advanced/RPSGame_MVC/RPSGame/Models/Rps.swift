//
//  Rps.swift
//  RPSGame
//
//  Created by Kaala on 2023/01/31.
//

import UIKit


protocol GetRPSInfo {
    var rpsInfo:(image:UIImage,name:String) {get}
}

enum Rps:Int, GetRPSInfo {
    case ready
    case rock
    case paper
    case scissors

    var rpsInfo:(image:UIImage, name:String) {
        switch self {
            case .ready:return (UIImage(named:"ready.png")!,"준비")
            case .rock:return (UIImage(named:"rock.png")!,"바위")
            case .paper:return (UIImage(named:"paper.png")!,"보")
            case .scissors:return (UIImage(named:"scissors.png")!,"가위")
                
        }
    }
}
