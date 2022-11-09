//
//  LoginScreen.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 10/10/22.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "AppIconNubank")
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.text = "Um mundo financeiro sem complexidades"
        return label
    }()
    
    lazy var emailTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite seu Email:"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.placeholder = "Digite sua Senha:"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 107/255, green: 18/255, blue: 147/255, alpha: 1.0)

        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()

    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        self.setUpConstrains()
        self.configButtonEnable(false)
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
    }
    
    private func configSuperView() {
        self.addSubview(self.sentenceLabel)
        self.addSubview(self.emailTextfield)
        self.addSubview(self.passwordTextfield)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        self.addSubview(self.logoAppImageView)
        
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextfield.delegate = delegate
        self.passwordTextfield.delegate = delegate
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    


    private func configButtonEnable(_ enanle: Bool) {
        if enanle{
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else{
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String {
        
        return self.emailTextfield.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordTextfield.text ?? ""
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstrains() {
        
        NSLayoutConstraint.activate([
            
                self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
                self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
                self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
                self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
                
            
                self.registerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5),
                self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                self.registerButton.heightAnchor.constraint(equalToConstant: 45),

                self.loginButton.bottomAnchor.constraint(equalTo: self.registerButton.topAnchor, constant: -15),
                self.loginButton.leadingAnchor.constraint(equalTo: self.registerButton.leadingAnchor),
                self.loginButton.trailingAnchor.constraint(equalTo: self.registerButton.trailingAnchor ),
                self.loginButton.heightAnchor.constraint(equalTo: self.registerButton.heightAnchor),

                self.passwordTextfield.bottomAnchor.constraint(equalTo: self.loginButton.topAnchor, constant: -20),
                self.passwordTextfield.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
                self.passwordTextfield.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
                self.passwordTextfield.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor),

                self.emailTextfield.bottomAnchor.constraint(equalTo: self.passwordTextfield.topAnchor, constant: -20),
                self.emailTextfield.leadingAnchor.constraint(equalTo: self.passwordTextfield.leadingAnchor),
                self.emailTextfield.trailingAnchor.constraint(equalTo: self.passwordTextfield.trailingAnchor),
                self.emailTextfield.heightAnchor.constraint(equalTo: self.passwordTextfield.heightAnchor),
                
                self.sentenceLabel.bottomAnchor.constraint(equalTo: self.emailTextfield.topAnchor, constant: -30),
                self.sentenceLabel.leadingAnchor.constraint(equalTo: self.emailTextfield.leadingAnchor),
                self.sentenceLabel.trailingAnchor.constraint(equalTo: self.emailTextfield.trailingAnchor)
                
        ])
    }
}



