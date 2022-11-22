//
//  TabBarVC.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 11/11/22.
//

import UIKit

enum TabBarVCString: String {
    case imageDollar = "dollarsign"
    case imageArrow = "arrow.up.arrow.down"
    case imageSuitcase = "suitcase"
}

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
    }
    
    private func setupTabBarController() {
        
        let tela01 = UINavigationController(rootViewController: HomeVC())
        let tela02 = UINavigationController(rootViewController: Tela02VC())
        let tela03 = UINavigationController(rootViewController: Tela03VC())
        self.setViewControllers([tela01, tela02, tela03], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        
        guard let items = tabBar.items else{return}
        
        items[0].image = UIImage(systemName: TabBarVCString.imageArrow.rawValue)
        
        items[1].image = UIImage(systemName: TabBarVCString.imageDollar.rawValue)
        
        items[2].image = UIImage(systemName: TabBarVCString.imageSuitcase.rawValue)
        
        
        
    }
    
}



