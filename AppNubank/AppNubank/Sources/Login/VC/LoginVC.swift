//
//  ViewController.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 07/10/22.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        self.configKeyoard()
        self.dismissKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configKeyoard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardSubir(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardOriginal(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardSubir(notification:)), name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardSubir(notification:Notification){
        view.frame.origin.y = -290
    }
    
    @objc func keyboardOriginal(notification:Notification){
        view.frame.origin.y = 0
    }
    
    func cadastroTest() {
        
        self.auth?.createUser(withEmail: "bah@hotmail.com", password: "1234567", completion: { authResult , error in
            if error == nil {
                print("sucesso ")
            }else{
                print("falha \(error?.localizedDescription ?? "")")
            }
        })
    }
    
    public func validaTextField() {
        let email: String = self.loginScreen?.emailTextfield.text ?? ""
        let password: String = self.loginScreen?.passwordTextfield.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enanle: Bool) {
        if enanle{
            self.loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            self.loginScreen?.loginButton.isEnabled = true
        }else{
            self.loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginScreen?.loginButton.isEnabled = false
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.loginScreen?.emailTextfield){
            self.loginScreen?.passwordTextfield.becomeFirstResponder()
        }else{
            self.loginScreen?.passwordTextfield.resignFirstResponder()
        }
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 0
        }
        switch textField {
        case self.loginScreen?.emailTextfield:
            
            if (self.loginScreen?.emailTextfield.text ?? "").isValid(validType: .email) {
                self.loginScreen?.emailTextfield.layer.borderWidth = 0
            } else {
                self.loginScreen?.emailTextfield.layer.borderWidth = 1.5
                self.loginScreen?.emailTextfield.layer.borderColor = UIColor.red.cgColor
            }
            break
        case self.loginScreen?.passwordTextfield:
            
            if (self.loginScreen?.passwordTextfield.text ?? "").isValid(validType: .password) {
                self.loginScreen?.passwordTextfield.layer.borderWidth = 0
            } else {
                self.loginScreen?.passwordTextfield.layer.borderWidth = 1.5
                self.loginScreen?.passwordTextfield.layer.borderColor = UIColor.red.cgColor
            }
        default:
            break
        }
        self.validaTextField()
    }
}

extension LoginVC: LoginScreenProtocol {
    
    func actionLoginButton() {
        let vc: TabBarVC = TabBarVC()
        guard let login = self.loginScreen else {return}
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique seus dados")
            }else{
                if user == nil{
                    print("falha \(error?.localizedDescription ?? "")")
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde")
                }else{
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
    }
    
    func actionRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
