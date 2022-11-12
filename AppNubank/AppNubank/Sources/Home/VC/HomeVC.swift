//
//  HomeVC.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 12/10/22.
//

import UIKit

class HomeVC: UIViewController {

    var homeScreen: HomeScreen?
    let  viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 126/255, green: 26/255, blue: 183/255, alpha: 1.0)
        viewModel.fetch(.request)
    }

}
