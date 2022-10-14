//
//  RegisterScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/10/22.
//

import UIKit



class RegisterScreen: UIView {
    
    var cell: CustomTableViewCell = CustomTableViewCell()
    

    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 126/255, green: 26/255, blue: 183/255, alpha: 1.0)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        return tableView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.addSubView()
        self.setUpConstraints()
        
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, datasource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = datasource
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 126/255, green: 26/255, blue: 183/255, alpha: 1.0)
    }
    
    func addSubView() {
        self.addSubview(self.tableView)
    }
    
    private func configSuperView() {
        self.addSubview(self.tableView)

    }
    


    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        
        ])
        
        
        
    }
    
}


