//
//  CustomTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/10/22.
//

import UIKit
import TLCustomMask

protocol RegisterTableViewCellProtocol: AnyObject{
    func actionRegisterButton(user: User)
}

class RegisterTableViewCell: UITableViewCell {
    
    static let identifier: String = "RegisterTableViewCell"
    
    var cpfMask: TLCustomMask?
    var phoneMask: TLCustomMask?
    
    weak private var delegate: RegisterTableViewCellProtocol?

    func delegate(delegate: RegisterTableViewCellProtocol) {
        self.delegate = delegate
    }
    
    lazy var screenCell: RegisterTableViewCellScreen = {
        let view = RegisterTableViewCellScreen()
        view.delegate(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configBackGround()
        self.addSubView()
        self.setUpConstraintsScreenCell()
        self.configTextFieldDelegate()
        self.configCustomMask()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configCustomMask(){
        screenCell.cpfTextField.delegate = self
        cpfMask = TLCustomMask(formattingPattern: "$$$.$$$.$$$-$$")
        
        screenCell.phoneTextField.delegate = self
        phoneMask = TLCustomMask(formattingPattern: "($$)$$$$$-$$$$")
        
    }
    
    private func configBackGround() {
        self.contentView.backgroundColor = UIColor(red: 126/255, green: 26/255, blue: 183/255, alpha: 1.0)
    }
    

    private func addSubView(){
        self.contentView.addSubview(self.screenCell)        
    }
    
    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            self.screenCell.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screenCell.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screenCell.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screenCell.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configTextFieldDelegate() {
        screenCell.nameTextField.delegate = self
        screenCell.emailTextField.delegate = self
        screenCell.ageTextField.delegate = self
        screenCell.phoneTextField.delegate = self
        screenCell.addressTextField.delegate = self
        screenCell.cpfTextField.delegate = self
        screenCell.passwordTextField.delegate = self
    }
    
    
    public func validaTextField() {
        
        let email: String = screenCell.emailTextField.text ?? ""
        let password: String = screenCell.passwordTextField.text ?? ""
        let name: String = screenCell.nameTextField.text ?? ""
        let age: String = screenCell.ageTextField.text ?? ""
        let phone: String = screenCell.phoneTextField.text ?? ""
        let address: String = screenCell.addressTextField.text ?? ""
        let cpf: String = screenCell.cpfTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty && !age.isEmpty && !phone.isEmpty && !address.isEmpty && !cpf.isEmpty && !name.isEmpty && (self.screenCell.emailTextField.text ?? "").isValid(validType: .email) && self.screenCell.phoneTextField.text?.count == 14 {
            
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }

    
    private func configButtonEnable(_ enable: Bool){
        if enable {
            screenCell.registerButton.setTitleColor(.black, for: .normal)
            screenCell.registerButton.isEnabled = true
        }else{
            screenCell.registerButton.setTitleColor(.lightGray, for: .normal)
            screenCell.registerButton.isEnabled = false
        }
    }
    
    
}

extension RegisterTableViewCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODA A LOGICA DEVE SER FEITA NO DID END (LOGICA DE VALIDACAO)
        print("textFieldDidEndEditing")
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 0
        }
        
        
        switch textField {
        case self.screenCell.cpfTextField:
            
            // logica para verificar o CPF
            if  screenCell.cpfTextField.text?.count == 14 {
                screenCell.cpfTextField.layer.borderWidth = 0
            } else {
                screenCell.cpfTextField.layer.borderWidth = 1.5
                screenCell.cpfTextField.layer.borderColor = UIColor.red.cgColor
            }
                       
            break
        case self.screenCell.passwordTextField:
            
            // logica para validar password
            if (self.screenCell.passwordTextField.text ?? "").isValid(validType: .password) {
                screenCell.passwordTextField.layer.borderWidth = 0
            } else {
                screenCell.passwordTextField.layer.borderWidth = 1.5
                screenCell.passwordTextField.layer.borderColor = UIColor.red.cgColor
            }
            
        case self.screenCell.emailTextField:
            // logica para verificar o Email
            if (self.screenCell.emailTextField.text ?? "").isValid(validType: .email) {
                screenCell.emailTextField.layer.borderWidth = 0
            } else {
                screenCell.emailTextField.layer.borderWidth = 1.5
                screenCell.emailTextField.layer.borderColor = UIColor.red.cgColor
            }

        case self.screenCell.phoneTextField:
            // logica para verificar o Phone
            
            if  screenCell.phoneTextField.text?.count == 14 {
                screenCell.phoneTextField.layer.borderWidth = 0
            } else {
                screenCell.phoneTextField.layer.borderWidth = 1.5
                screenCell.phoneTextField.layer.borderColor = UIColor.red.cgColor
            }
        default:
            break
        }
        
        validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       return textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
            
        case screenCell.cpfTextField:
            if let text: String = cpfMask?.formatStringWithRange(range: range, string: string){
                self.screenCell.cpfTextField.text = text
                return false
            }else{
                return true
            }
            
            
        case screenCell.phoneTextField:
            if let text: String = phoneMask?.formatStringWithRange(range: range, string: string){
                self.screenCell.phoneTextField.text = text
                return false
            }else{
                return true
            }
        default:
            return true
        }
    }
    
}

extension RegisterTableViewCell: RegisterTableViewCellScreenProtocol {
    func tappedRegisterButton() {
        print(#function)
        
      
        
        self.delegate?.actionRegisterButton(user: User(name: screenCell.nameTextField.text ?? "", email: screenCell.emailTextField.text ?? "", age: screenCell.ageTextField.text ?? "", phone: screenCell.phoneTextField.text ?? "", address: screenCell.addressTextField.text ?? "", cpf: screenCell.cpfTextField.text ?? "", password: screenCell.passwordTextField.text ?? ""))
    }
}
