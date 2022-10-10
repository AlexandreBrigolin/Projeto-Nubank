//
//  ViewController.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 07/10/22.
//

import UIKit


class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

