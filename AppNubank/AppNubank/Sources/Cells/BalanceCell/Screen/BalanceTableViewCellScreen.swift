//
//  BalanceCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

protocol BalanceTableViewCellScreenProtocol: AnyObject {
    func actionBalance()
}

class BalanceTableViewCellScreen: UIView {
    
    weak private var delegate: BalanceTableViewCellScreenProtocol?

    func delegate(delegate: BalanceTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.balanceLabel)
        self.addSubview(self.valueLabel)        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.balanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.balanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.balanceLabel.heightAnchor.constraint(equalToConstant: 25),
            
            self.valueLabel.topAnchor.constraint(equalTo: self.balanceLabel.bottomAnchor, constant: 10),
            self.valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
            
        ])
    }
}

