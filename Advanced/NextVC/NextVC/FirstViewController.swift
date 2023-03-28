//
//  FirstViewController.swift
//  NextVC
//
//  Created by Kaala on 2023/03/28.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy private var mainLabel:UILabel = {
        let label = UILabel()
        label.text = "FirstViewController"
        label.font = .systemFont(ofSize: 22)
        view.addSubview(label)
        return label
    }()
    
    lazy private var backButton:UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .gray
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(backButtonTapped), for: 
                .touchUpInside)
        button.addTarget(self, action: #selector(buttonHeldDown), for:
                .touchDown)
        button.addTarget(self, action: #selector(buttonDragExit), for:
                .touchDragExit)
        view.addSubview(button)
        return button
    }()
    
    var someString:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainLabel.text = someString
        configureUI()
    }
    
    @objc func backButtonTapped(){
        backButton.backgroundColor = .gray
        self.dismiss(animated: true)
    }
    
    @objc func buttonHeldDown(){
        backButton.backgroundColor = .black
    }
    
    @objc func buttonDragExit(){
        backButton.backgroundColor = .gray
    }
    
    func configureUI(){
        view.backgroundColor = .white
        setAutoLayout()
    }
    
    func setAutoLayout(){
        [mainLabel,backButton]
            .forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    


}
