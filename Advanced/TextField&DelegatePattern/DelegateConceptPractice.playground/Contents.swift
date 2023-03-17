import UIKit

// 자격증 정의 (텍스트필드 프로토콜) 채택할 경우 몸체 구현해줘야함
protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}


// 리모콘 클래스(텍스트필드의 역할 - 직접적으로 유저와 커뮤니케이션)
// 델리게이트를 통해 내부 구현을 가리고, 외부에서 연결해서 필요한 기능만 사용하도록 할 수 있다
class RemoteControl {
    var delegate:RemoteControlDelegate?
    
    func doSomething(){
        print("Remote Control is on")
    }
    
    func channelUp(){
        guard let delegate else { print("no delegate has been set up yet"); return }
        delegate.channelUp()
    }
    
    func channelDown(){
        guard let delegate else { print("no delegate has been set up yet"); return }
        delegate.channelDown()
    }
}


// TV 클래스 (뷰컨트롤러 역할 - 리모콘과 커뮤니케이션)
class TV {
    private var brandName:String = ""
    
    init(brandName:String){
        self.brandName = brandName
    }
    
    func callName(){
        print("\(brandName)TV")
    }
}

extension TV:RemoteControlDelegate {
        func channelUp() {
            print("\(self.brandName)TV Channel Up")
        }
    
        func channelDown() {
            print("\(self.brandName)TV Channel Down")
        }
}


let remote = RemoteControl()
remote.channelUp()
remote.channelDown()

let appleTV = TV(brandName: "apple")
appleTV.callName()
remote.delegate = appleTV
remote.channelUp()
remote.channelDown()

let samsungTV = TV(brandName: "samsung")
samsungTV.callName()
remote.delegate = samsungTV
remote.channelUp()
remote.channelDown()

