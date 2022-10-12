//
//  CustomTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier: String = "CustomTableViewCell"
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cadastrar"
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
        textfield.keyboardType = .emailAddress
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
        textfield.keyboardType = .emailAddress
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
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite seu endereço:"
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
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite sua senha:"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        
        return textfield
    }()
    
    lazy var repeatPasswordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Repetir senha"
        //        tf.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        
        return textfield
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor =  UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        //        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView(){
        
        self.contentView.addSubview(self.registerLabel)
        self.contentView.addSubview(self.nameTextField)
        self.contentView.addSubview(self.emailTextField)
        self.contentView.addSubview(self.ageTextField)
        self.contentView.addSubview(self.phoneTextField)
        self.contentView.addSubview(self.addressTextField)
        self.contentView.addSubview(self.passwordTextField)
        self.contentView.addSubview(self.repeatPasswordTextField)
        self.contentView.addSubview(self.registerButton)
        
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
        
            self.registerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.registerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.registerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registerLabel.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
}
