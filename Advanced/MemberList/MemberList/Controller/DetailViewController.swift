//
//  DetailViewController.swift
//  MemberList
//
//  Created by Kaala on 2023/05/31.
//

import PhotosUI
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
        setupTapGestures()
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
    
    //MARK: - Image View Functions
    private func setupTapGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(tapGesture)
        detailView.mainImageView.isUserInteractionEnabled = true
    }
    
    
    @objc private func touchUpImageView(){
        print("Image View Touched")
        setupImagePicker()
    }
    
    private func setupImagePicker(){
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        config.filter = .any(of: [.images,.videos])
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    
    
    deinit {
        print("pop detailVC")
    }
    
    
    

}

extension DetailViewController:PHPickerViewControllerDelegate {
    
    //method called after pick photo
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        if let itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async { // 화면을 그리는 동작들은 메인 스레드에서!
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("failed to load image")
        }
        
    }
    
    
}
