//
//  HomeScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 11/11/22.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 126/255, green: 26/255, blue: 183/255, alpha: 1.0)
        return tableView
    }()
    

}
