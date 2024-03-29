//
//  Member.swift
//  MemberList
//
//  Created by Kaala on 2023/05/30.
//

import UIKit

protocol MemberDelegate:AnyObject { // AnyObject를 통해 클래스만 채택할 수 있도록 해준다. weak 사용을 위함
    func addNewMember(_ member:Member)
    func update(index: Int, _ member:Member)
}

struct Member {
    
    lazy var memberImage:UIImage? = {
        guard let name else {return UIImage(systemName: "person")}
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    static var memberNumbers:Int = 0 // 인스턴스들이 공유하는 변수. 타입 저장 속성
    
    let memberId:Int
    var name:String?
    var age:Int?
    var phone:String?
    var address:String?
    
    init(name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
        self.memberId = Member.memberNumbers
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1
    }
    
}
