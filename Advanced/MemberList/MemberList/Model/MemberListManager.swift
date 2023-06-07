//
//  MemberListManager.swift
//  MemberList
//
//  Created by Kaala on 2023/05/30.
//

import UIKit

struct MemberListManager {
    
    private var memberList:[Member] = []
    
    
    // 초기화 시점에 데이터세팅하면 memberId가 꼬인다.
    // VC에서 MembereListManager가 여러번 초기화되면서 Member의 멤버변수 memberNumbers가 올라버리는 문제
//    init() {
//        requestMemberData()
//    }
    
    mutating func requestMemberData(){
        print(#function)
        memberList = [
            Member(name: "홍길동", age: 20, phone: "010-1111-2222", address: "서울"),
            Member(name: "임꺽정", age: 23, phone: "010-2222-3333", address: "서울"),
            Member(name: "스티브", age: 50, phone: "010-1234-1234", address: "미국"),
            Member(name: "쿡", age: 30, phone: "010-7777-7777", address: "캘리포니아"),
            Member(name: "베조스", age: 50, phone: "010-2222-7777", address: "하와이"),
            Member(name: "배트맨", age: 40, phone: "010-3333-1234", address: "고담씨티"),
            Member(name: "조커", age: 40, phone: "010-4321-1234", address: "고담씨티")
        ]
    }
    
    func getMemberList()->[Member]{
        return memberList
    }
    
    mutating func addMember(_ member:Member){
        memberList.append(member)
    }
    
    mutating func updateMemberInfo(id:Int, _ member:Member){
        print(memberList.count)
        print("id is \(id)")
        memberList[id] = member
    }
    
    subscript(index:Int)->Member {
        get{
            return memberList[index]
        }
    }
    
}
