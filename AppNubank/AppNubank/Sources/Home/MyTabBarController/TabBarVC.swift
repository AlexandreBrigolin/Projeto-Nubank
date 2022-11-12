//
//  TabBarVC.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 11/11/22.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
    }
    
    private func setupTabBarController() {
        
        let tela01 = UINavigationController(rootViewController: Tela01())
        let tela02 = UINavigationController(rootViewController: Tela02())
        let tela03 = UINavigationController(rootViewController: Tela03())
        self.setViewControllers([tela01, tela02, tela03], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        guard let items = tabBar.items else{return}
        
        items[0].image = UIImage(systemName: "person")
        
        items[1].image = UIImage(systemName: "star")
        
        items[2].image = UIImage(systemName: "trash")
        
    }
    
}

class Tela01: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
}

class Tela02: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
    
}

class Tela03: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
    }
    
}
