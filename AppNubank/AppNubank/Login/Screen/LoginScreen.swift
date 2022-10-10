//
//  LoginScreen.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 10/10/22.
//

import UIKit

class LoginScreen: UIView {
    
    lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.text = "Um mundo financeiro sem complexidades"
        return label
    }()
    
    lazy var cpfTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu CPF"
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
        tf.placeholder = "Digite sua senha"
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
        button.backgroundColor = .purple
        return button
    }()

    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        self.setUpConstrains()
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 126/255, green: 26/255, blue: 183/255, alpha: 1.0)
    }
    
    private func configSuperView() {

        self.addSubview(self.sentenceLabel)
        self.addSubview(self.cpfTextfield)
        self.addSubview(self.passwordTextfield)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstrains() {
        
        NSLayoutConstraint.activate([

            self.sentenceLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.sentenceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.sentenceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.cpfTextfield.topAnchor.constraint(equalTo: self.sentenceLabel
                .bottomAnchor, constant: 20),
            self.cpfTextfield.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.cpfTextfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.cpfTextfield.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextfield.topAnchor.constraint(equalTo: self.cpfTextfield.bottomAnchor, constant: 20),
            self.passwordTextfield.leadingAnchor.constraint(equalTo: self.cpfTextfield.leadingAnchor),
            self.passwordTextfield.trailingAnchor.constraint(equalTo: self.cpfTextfield.trailingAnchor),
            self.passwordTextfield.heightAnchor.constraint(equalTo: self.cpfTextfield.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextfield.bottomAnchor, constant: 15),
            self.loginButton.leadingAnchor.constraint(equalTo: self.passwordTextfield.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.passwordTextfield.trailingAnchor ),
            self.loginButton.heightAnchor.constraint(equalTo: self.passwordTextfield.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor ),
            self.registerButton.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor),
        
        ])
    }
    
}



//            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
//            self.backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
//            self.backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
//            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),


//        self.addSubview(self.backgroundImageView)


//    lazy var backgroundImageView: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "nubankImage")
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
