//
//  ViewController.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 07/10/22.
//

import UIKit
import Firebase


class RegisterVC: UIViewController  {
    
    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    var Custom: CustomTableViewCell?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        self.configKeyoard()
        self.Custom = CustomTableViewCell()
        
        
    }
    
    func configKeyoard(){
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
        
        view.frame.origin.y = -80
        
    }
    
    @objc func keyboardOriginal(notification:Notification){
        
        print("O teclado mostrará: \(notification.name.rawValue)")
        
        view.frame.origin.y = 0
    }
    
}

extension RegisterVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
}

extension RegisterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.screenCell.delegate(delegate: self)
        return cell ?? CustomTableViewCell()
    }
    
}

extension RegisterVC: RegisterScreenProtocol {
    
    func actionRegisterButton(user: User) {
        print(#function)
        print(user)
     
    }
    
    
        
        
        
        
        
        //        self.auth?.createUser(withEmail: user.email, password: user.password, completion: { result, error in
        //            if error == nil {
        //                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique seus dados")
        //            }else{
        //                if result == nil {
        //                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente")
        //                }else {
        //                    print("Cadastro realizado com sucesso!")
  
    //                }
        //            }
        //        })
        
    }
    


extension UITextField {
    
    func validateEmail()->Bool{
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+//.[A-Za-z]{2,64}"
        let validadteRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validadteRegex.evaluate(with: self.text)
    }
    
    func validatePassword()->Bool{
        let passwordRegex: String = ".{6,}"
        let validadteRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return validadteRegex.evaluate(with: self.text)
    }
}
