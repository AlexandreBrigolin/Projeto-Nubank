//
//  CustomTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/10/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject{
    func actionRegisterButton(user: User)
}

class CustomTableViewCell: UITableViewCell {
    
    private var viewModel: CustomTableViewCellViewModel = CustomTableViewCellViewModel()
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol) {
        self.delegate = delegate
    }
    
    static let identifier: String = "CustomTableViewCell"
    
    
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
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite seu nome:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        textfield.delegate = self
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
        textfield.delegate = self
        return textfield
    }()
    
    lazy var ageTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite sua idade:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        textfield.delegate = self
        return textfield
    }()
    
    lazy var phoneTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite seu telefone:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        textfield.delegate = self
        return textfield
    }()
    
    lazy var addressTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite seu endereço:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        textfield.delegate = self
        return textfield
    }()
    
    lazy var cpfTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite seu CPF:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        textfield.delegate = self
        return textfield
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite sua senha:"
        textfield.isSecureTextEntry = true
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        textfield.delegate = self
        return textfield
    }()
    
//    lazy var repeatPasswordTextField: UITextField = {
//        let textfield = UITextField()
//        textfield.translatesAutoresizingMaskIntoConstraints = false
//        textfield.autocorrectionType = .no
//        textfield.backgroundColor = .white
//        textfield.borderStyle = .roundedRect
//        textfield.keyboardType = .emailAddress
//        textfield.placeholder = "Repetir senha:"
//        //        tf.font = UIFont.systemFont(ofSize: 14)
//        textfield.textColor = .darkGray
//
//        return textfield
//    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configBackGround()
        self.addSubView()
        self.setUpConstraints()
        self.configButtonEnable(false)
        
    }
    
    private func configBackGround() {
        self.contentView.backgroundColor = UIColor(red: 126/255, green: 26/255, blue: 183/255, alpha: 1.0)
    }

    func addSubView(){
        self.contentView.addSubview(self.registerLabel)
        self.contentView.addSubview(self.nameTextField)
        self.contentView.addSubview(self.emailTextField)
        self.contentView.addSubview(self.ageTextField)
        self.contentView.addSubview(self.phoneTextField)
        self.contentView.addSubview(self.addressTextField)
        self.contentView.addSubview(self.cpfTextField)
        self.contentView.addSubview(self.passwordTextField)
        self.contentView.addSubview(self.registerButton)
        
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton(user: User(name: nameTextField.text ?? "", email: emailTextField.text ?? "", age: ageTextField.text ?? "", phone: phoneTextField.text ?? "", address: addressTextField.text ?? "", cpf: cpfTextField.text ?? "", password: passwordTextField.text ?? ""))
    }
    
    
     public func validaTextField() {
         let email: String = self.emailTextField.text ?? ""
         let password: String = self.passwordTextField.text ?? ""
 
         if !email.isEmpty && !password.isEmpty {
             
             self.configButtonEnable(true)
         }else{
             self.configButtonEnable(false)
         }
     }

     private func configButtonEnable(_ enable: Bool){
         
         if enable {
             self.registerButton.setTitleColor(.white, for: .normal)
             self.registerButton.isEnabled = true
         }else{
             self.registerButton.setTitleColor(.lightGray, for: .normal)
             self.registerButton.isEnabled = false
         }
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            self.registerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.registerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerLabel.heightAnchor.constraint(equalToConstant: 45),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.registerLabel.bottomAnchor, constant: 10),
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
            
            
//            self.repeatPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
//            self.repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
//            self.repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
//            self.repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 45),
                        
        ])
    }
    
}


extension CustomTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODA A LOGICA DEVE SER FEITA NO DID END (LOGICA DE VALIDACAO)
        print("textFieldDidEndEditing")
        self.validaTextField()
    }
    
}
