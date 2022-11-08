//
//  ScreenTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 21/10/22.
//

import UIKit

protocol RegisterTableViewCellScreenProtocol: AnyObject {
    func actionBackButton()
    func tappedRegisterButton()
}

class RegisterTableViewCellScreen: UIView {

    weak private var delegate: RegisterTableViewCellScreenProtocol?
    
    func delegate(delegate: RegisterTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cadastrar"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .black
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .default
        textfield.placeholder = "Digite seu nome:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite seu Email:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    lazy var ageTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .numberPad
        textfield.placeholder = "Digite sua idade:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    lazy var phoneTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .numberPad
        textfield.placeholder = "Digite seu telefone:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    lazy var addressTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .default
        textfield.placeholder = "Digite seu endereço:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    lazy var cpfTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .numberPad
        textfield.placeholder = "Digite seu CPF:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .default
        textfield.placeholder = "Digite sua senha:"
        textfield.isSecureTextEntry = true
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    
    @objc private func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
    }
    
    
    @objc private func tappedBackButton() {
        
        self.delegate?.actionBackButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.setUpConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView(){
        self.addSubview(self.registerLabel)
        self.addSubview(self.nameTextField)
        self.addSubview(self.emailTextField)
        self.addSubview(self.ageTextField)
        self.addSubview(self.phoneTextField)
        self.addSubview(self.addressTextField)
        self.addSubview(self.cpfTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
        self.addSubview(self.backButton)
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            self.registerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70),
            self.registerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerLabel.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.registerLabel.bottomAnchor, constant: 30),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.ageTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.ageTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.ageTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.ageTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.phoneTextField.topAnchor.constraint(equalTo: self.ageTextField.bottomAnchor, constant: 20),
            self.phoneTextField.leadingAnchor.constraint(equalTo: self.ageTextField.leadingAnchor),
            self.phoneTextField.trailingAnchor.constraint(equalTo: self.ageTextField.trailingAnchor),
            self.phoneTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.addressTextField.topAnchor.constraint(equalTo: self.phoneTextField.bottomAnchor, constant: 20),
            self.addressTextField.leadingAnchor.constraint(equalTo: self.phoneTextField.leadingAnchor),
            self.addressTextField.trailingAnchor.constraint(equalTo: self.phoneTextField.trailingAnchor),
            self.addressTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.cpfTextField.topAnchor.constraint(equalTo: self.addressTextField.bottomAnchor, constant: 20),
            self.cpfTextField.leadingAnchor.constraint(equalTo: self.addressTextField.leadingAnchor),
            self.cpfTextField.trailingAnchor.constraint(equalTo: self.addressTextField.trailingAnchor),
            self.cpfTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.cpfTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.cpfTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.cpfTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 45),
                        
        ])
    }

}
