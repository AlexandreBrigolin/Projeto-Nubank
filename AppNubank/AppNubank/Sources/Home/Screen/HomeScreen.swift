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
        tableView.backgroundColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.register(BalanceTableViewCell.self, forCellReuseIdentifier: BalanceTableViewCell.identifier)
        tableView.register(AccountMovimentedTableViewCell.self, forCellReuseIdentifier: AccountMovimentedTableViewCell.identifier)
        tableView.register(MyCardsTableViewCell.self, forCellReuseIdentifier: MyCardsTableViewCell.identifier)
        tableView.register(ADSTableViewCell.self, forCellReuseIdentifier: ADSTableViewCell.identifier)
        tableView.register(LineTableViewCell.self, forCellReuseIdentifier: LineTableViewCell.identifier)
        tableView.register(CreditCardTableViewCell.self, forCellReuseIdentifier: CreditCardTableViewCell.identifier)
        tableView.register(FollowAlsoTableViewCell.self, forCellReuseIdentifier: FollowAlsoTableViewCell.identifier)
        tableView.register(LoanTableViewCell.self, forCellReuseIdentifier: LoanTableViewCell.identifier)
        tableView.register(DiscoverMoreTableViewCell.self, forCellReuseIdentifier: DiscoverMoreTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.configBackGround()
        self.addSubView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }

    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
    }
    
    func addSubView() {
        self.addSubview(self.tableView)
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
