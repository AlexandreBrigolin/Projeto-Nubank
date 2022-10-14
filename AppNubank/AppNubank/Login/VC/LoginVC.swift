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
        self.cadastroTest()
        self.alert = Alert(controller: self)
        self.configKeyoard()
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
        
        print("O teclado mostrará: \(notification.name.rawValue)")
        
        view.frame.origin.y = -290
    }
    
    @objc func keyboardOriginal(notification:Notification){
        
        print("O teclado mostrará: \(notification.name.rawValue)")
        
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
        
        let vc: HomeVC = HomeVC()
        
        
   guard let login = self.loginScreen else {return}

        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in

     if error != nil {
         self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique seus dados")
     }else{
         if user == nil{
             print("falha \(error?.localizedDescription ?? "")")
             self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde")
         }else{
             print("Login realizado com sucesso")
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
