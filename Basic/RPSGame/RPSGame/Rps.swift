//
//  Rps.swift
//  RPSGame
//
//  Created by Kaala on 2023/01/31.
//

import Foundation


protocol GetRpsString {
    var description:String {get}
}

enum Rps:Int,GetRpsString {
    case rock
    case paper
    case scissors
    
    var description: String {
        switch self {
            case .rock: return "바위"
            case .paper: return "보"
            case .scissors: return "가위"
        }
    }
}
