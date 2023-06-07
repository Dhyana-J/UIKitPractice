//
//  DetailViewController.swift
//  MemberList
//
//  Created by Kaala on 2023/05/31.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    var member:Member?
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setButtonAction()
    }
    
    private func setData(){
        detailView.member = member
    }
    
    private func setButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped(){
        print(#function)
        
        if member == nil {
            // Add member screen
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phone = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            var newMember = Member(name:name,age:age,phone:phone,address: address)
            newMember.memberImage = detailView.mainImageView.image
            
            
            // 1. non-delegate implememtation
            let index = navigationController!.viewControllers.count - 2 // 현재 화면 이전 화면에 접근할 것이니 -2
            let vc = navigationController?.viewControllers[index] as! ViewController
            vc.memberListManager.addMember(newMember)
            
            // 2. delegate implememtation
//            delegate?.addNewMember(newMember)
            
        } else {
            // Update member screen
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
//            detailView.member = member // ? what is this for?
            
            // 1. non-delegate implememtation
            let index = navigationController!.viewControllers.count - 2 // 현재 화면 이전 화면에 접근할 것이니 -2
            let vc = navigationController?.viewControllers[index] as! ViewController
            
            vc.memberListManager.updateMemberInfo(id: memberId, member!)
            
            // 2. delegate implememtation
//            delegate?.update(index:memberId,member!)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    deinit {
        print("pop detailVC")
    }
    
    
    

}
