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
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        self.loginScreen?.validaTextField()
    }
}


extension LoginVC: LoginScreenProtocol {
    
    func actionLoginButton() {
//        let vc: HomeVC = HomeVC()
//        self.navigationController?.pushViewController(vc, animated: true)
      

 guard let login = self.loginScreen else {return}
 
 self.auth?.signIn(withEmail: login.getCPF(), password: login.getPassword(), completion: { user, error in
     
     if error != nil {
         self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique seus dados")
     }else{
         if user == nil{
             self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde")
         }else{
             print("Login realizado com sucesso")
             
             self.performSegue(withIdentifier: "RegisterVC", sender: nil)
         }
     }
 })
 

    }
    
    func actionRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
