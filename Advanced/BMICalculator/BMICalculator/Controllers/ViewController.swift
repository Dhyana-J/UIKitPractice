//
//  ViewController.swift
//  BMICalculator
//
//  Created by Kaala on 2023/03/30.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy var mainLabel:UILabel = {
        let label = UILabel()
        label.text = "키와 몸무게를 입력해 주세요"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var heightStackview:UIStackView = {
        let sv = UIStackView(arrangedSubviews: [heightLabel,heightTextField])
        sv.axis = .horizontal
        sv.spacing = CGFloat(15)
        return sv
    }()
    
    lazy var heightLabel:UILabel = {
        let label = UILabel()
        label.text = "키"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var heightTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "키(cm)를 입력하세요"
        return textField
    }()
    
    lazy var weightStackview:UIStackView = {
        let sv = UIStackView(arrangedSubviews: [weightLabel,weightTextField])
        sv.axis = .horizontal
        sv.spacing = CGFloat(15)
        return sv
    }()
    
    lazy var weightLabel:UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var weightTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "몸무게(kg)를 입력하세요"
        return textField
    }()
    
    lazy var mainStackview:UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            mainLabel,
            heightStackview,
            weightStackview
        ])
        sv.spacing = CGFloat(20)
        sv.axis = .vertical
        sv.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9607843137, blue: 0.9215686275, alpha: 1)
        sv.layer.cornerRadius = CGFloat(15)
        sv.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        sv.isLayoutMarginsRelativeArrangement = true
        return sv
    }()
    
    lazy var calculateBtn:UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.768627451, blue: 0.6666666667, alpha: 1)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("BMI 계산하기", for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = CGFloat(10)
        btn.addTarget(self, action: #selector(calculateBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    var bmiManager = BMICalculatorManager()
    
    
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        setDelegate()
        setUI()
    }
    
    func setDelegate(){
        heightTextField.delegate = self
        weightTextField.delegate = self
    }
    
    func setUI(){
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.8705882353, blue: 0.7294117647, alpha: 1)
        view.addSubview(mainStackview)
        view.addSubview(calculateBtn)
        
        setConstraints()
    }
    
    func setConstraints(){
        
        [
            mainLabel,
            heightLabel,
            heightTextField,
            weightLabel,
            weightTextField,
            heightStackview,
            weightStackview,
            mainStackview,
            calculateBtn
        ].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            mainStackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            mainStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mainLabel.heightAnchor.constraint(equalToConstant: 35),
            heightLabel.heightAnchor.constraint(equalToConstant: 35),
            heightLabel.widthAnchor.constraint(equalToConstant: 60),
            weightLabel.heightAnchor.constraint(equalToConstant: 35),
            weightLabel.widthAnchor.constraint(equalToConstant: 60),
            calculateBtn.heightAnchor.constraint(equalToConstant: 45),
            calculateBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            calculateBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    @objc func calculateBtnTapped(_ sender:UIButton){
        guard let height = heightTextField.text,
              let weight = weightTextField.text,
              isInputsAreValid(height:height,weight: weight) else {
            print("invalid input")
            return
        }
        
        guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "bmiResultVC") as? BMIResultViewController else {return}
        resultVC.bmiStatus = bmiManager.getBMI(height: height, weight: weight)
        resultVC.modalPresentationStyle = .fullScreen
        
        self.present(resultVC, animated: true)
        resetTextFields()
    }
    
    func isInputsAreValid(height:String,weight:String)->Bool{
        if height == "" || weight == "" {
            mainLabel.text = "키와 몸무게를 반드시 입력해야합니다"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return true
    }
    
    func resetTextFields(){
        [weightTextField,heightTextField].forEach {$0.text = ""}
    }
    
    
    
    
    //MARK: - Segue로 구현했다면 (버튼에 직접적으로 Segue를 연결했을 경우)
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if heightTextField.text == "" || weightTextField.text == "" {
//            mainLabel.text = "키와 몸무게를 반드시 입력해야합니다"
//            mainLabel.textColor = .red
//            return false
//        }
//        mainLabel.text = "키와 몸무게를 입력해 주세요"
//        mainLabel.textColor = .black
//        return true
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SEGUE_IDENTIFIER"{
//            guard let resultVC = segue.destination as? BMIResultViewController else {return}
//            resultVC.bmi = bmiManager.calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
//        }
//    }
    
    
}

extension ViewController:UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (Int(string) != nil || string == "") ? true : false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            heightTextField.resignFirstResponder()
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

