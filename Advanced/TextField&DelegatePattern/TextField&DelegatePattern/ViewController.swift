//
//  ViewController.swift
//  TextField&DelegatePattern
//
//  Created by Kaala on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField! // 키보드는 OS가 관리하고, 내부의 복잡한 핵심 구현 코드들이 비공개여도, 델리게이트를 통해 기능을 사용할 수 있음

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        configureUI()
    }
    
    
    func configureUI(){
        view.backgroundColor = UIColor.gray
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .go
        print("canBecomeFirstResponder : \(textField.canBecomeFirstResponder)")
        textField.becomeFirstResponder() // 자동으로 텍스트필드 포커스 해줌
    }
    
    @IBAction func doneBtnTapped(_ sender: UIButton) {
        print(#function)
        textField.resignFirstResponder()
    }
    
    // detect screen tab
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        self.view.endEditing(true)
//        textField.resignFirstResponder()
    }
    
}

extension ViewController:UITextFieldDelegate {
    // textField 입력 시작하게 할지 말지 결정
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(#function)
    }
    
    // clearButton 눌렀을 때 동작
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드 각 문자들 입력 허용여부 결정
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength // 조건에 부합하면 새로이 문자열 교체, 아니면 기존 문자열 냅둠
        
    }
    
    // enter key 눌리게 할지말지 여부 결정
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Please Type Something"
            return false
        } else {
            view.endEditing(true)
            return true
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        if textField.text!.contains("1") {
            print("do not type 1 please")
            return false
        }
        
        print("Editing done")
        textField.text = ""
        return true
    }
}

