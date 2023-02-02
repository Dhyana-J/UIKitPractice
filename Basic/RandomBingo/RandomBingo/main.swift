//
//  main.swift
//  RandomBingo
//
//  Created by Kaala on 2023/02/01.
//

import Foundation


print("========= Bingo Game =========")
print("1부터 100까지의 정수 중 하나 입력 :", terminator: " ")


var userChoice = Int(readLine()!)!
let computerChoice = Int.random(in: 1...100)


while true {
    if computerChoice > userChoice {
        print("Up")
        getInputFromUser()
    } else if computerChoice == userChoice {
        print("Bingo!")
        break
    }
    else {
        print("Down")
        getInputFromUser()
    }
}


private func getInputFromUser(){
    print("1부터 100까지의 정수 중 하나 입력 :", terminator: " ")
    userChoice = Int(readLine()!)!
}

