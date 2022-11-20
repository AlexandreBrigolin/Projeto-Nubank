//
//  TabBarVC.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 11/11/22.
//

import UIKit

enum TabBarVCString: String {
    case imagePerson = "person"
    case imageStar = "star"
    case imageTrash = "trash"
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
        
        guard let items = tabBar.items else{return}
        
        items[0].image = UIImage(systemName: TabBarVCString.imagePerson.rawValue)
        
        items[1].image = UIImage(systemName: TabBarVCString.imageStar.rawValue)
        
        items[2].image = UIImage(systemName: TabBarVCString.imageTrash.rawValue)
        
    }
    
}



