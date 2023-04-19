//
//  loginView.swift
//  LoginUIWithoutStoryboard
//
//  Created by Kaala on 2023/04/18.
//

import UIKit

// View는 UI 관련 코드를 다룬다
final class LoginView:UIView {
    
    //MARK: - email 입력하는 텍스트뷰
    private lazy var emailTextFieldView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2203282714, green: 0.2203282714, blue: 0.2203282714, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        return view
    }()
    
    //login - email input field
    private lazy var emailTextField:UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return tf
    }()
    
    // email or phoneNumber placeholder
    private var emailInfoLabel:UILabel = {
        let label = UILabel()
        label.text = "email address or phone number"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()
    
    //MARK: - PW 입력하는 텍스트뷰
    private lazy var passwordTextFieldView:UIView = {
        let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.2203282714, green: 0.2203282714, blue: 0.2203282714, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    private lazy var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return tf
    }()
    
    private lazy var passwordInfoLabel:UILabel = {
        let label = UILabel()
        label.text = "password"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()
    
    private lazy var passwordSecureButton:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "eye.slash")  , for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return btn
    }()
    
    
    //MARK: - login button
    let loginButton:UIButton = {
        let btn = UIButton(type:.custom)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true // cornerRadius와 함께 사용됨 둥글게 잘라낼 때 테두리 영역을 잘라줌
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        btn.setTitle("login", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.isEnabled = false
        return btn
    }()
    
    
    lazy var stackView:UIStackView = {
        let stv = UIStackView(arrangedSubviews: [
            emailTextFieldView,
            passwordTextFieldView,
            loginButton
        ])
        stv.spacing = 18 // 스택뷰 간격 설정
        stv.axis = .vertical
        stv.distribution = .fillEqually
        stv.alignment = .fill
        return stv
    }()
    
    
    // reset password button
    lazy var passwordResetButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("Reset Password", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return btn
    }()

    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight:CGFloat = 48
    
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    
    
    @objc func passwordSecureModeSetting(){
        passwordSecureButton.setImage(
            UIImage(systemName: passwordTextField.isSecureTextEntry ? "eye":"eye.slash")
            , for: .normal)
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    
    
    func makeUI(){
        backgroundColor = .black
        addSubview(stackView)
        addSubview(passwordResetButton)
        
        [
            emailInfoLabel,
            emailTextField,
            passwordInfoLabel,
            passwordTextField,
            passwordSecureButton,
            stackView,
            passwordResetButton
        ].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            // email
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailInfoLabelCenterYConstraint,
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor,constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
            
            // password
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            passwordInfoLabelCenterYConstraint,
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor,constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor,constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor,constant: 8),
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // stack view
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
            
            // reset password
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight),
        ])
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setTextFieldsDelegate()
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LoginView:UITextFieldDelegate {
    func setTextFieldsDelegate(){
        [emailTextField,passwordTextField].forEach {$0.delegate = self}
    }
    
    func toggleTextFieldUI(textFieldType:UITextField,didBegin:Bool){
        switch textFieldType {
            case emailTextField:
                emailTextFieldView.backgroundColor = didBegin ? .darkGray : #colorLiteral(red: 0.2203282714, green: 0.2203282714, blue: 0.2203282714, alpha: 1)
                emailInfoLabel.font = .systemFont(ofSize: didBegin ? 11 : 18)
                emailInfoLabelCenterYConstraint.constant = didBegin ? -13 : 0
            case passwordTextField:
                passwordTextFieldView.backgroundColor = didBegin ? .darkGray : #colorLiteral(red: 0.2203282714, green: 0.2203282714, blue: 0.2203282714, alpha: 1)
                passwordInfoLabel.font = .systemFont(ofSize: didBegin ? 11 : 18)
                passwordInfoLabelCenterYConstraint.constant = didBegin ? -13 : 0
            default:return
        }
        UIView.animate(withDuration: 0.1) {
            self.stackView.layoutIfNeeded() // element.layoutIfNeeded() : element 하위의 모든 것들을 자연스럽게 이동처리
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        toggleTextFieldUI(textFieldType: textField, didBegin: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        toggleTextFieldUI(textFieldType: textField, didBegin: false)
    }
    
    
    @objc func textFieldEditingChanged(_ textField:UITextField){
        if textField.text?.count == 1,
            textField.text?.first == " " {
            textField.text = ""
            return
        }
        guard let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
        else {
            loginButton.backgroundColor = .clear
            loginButton.isEnabled = false
            return
        }
        loginButton.backgroundColor = .red
        loginButton.isEnabled = true
    }
}
