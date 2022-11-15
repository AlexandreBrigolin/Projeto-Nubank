//
//  BalanceCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

protocol BalanceCellScreenProtocol: AnyObject {
    func actionBalance()
}

class BalanceCellScreen: UIView {
    
    weak private var delegate: BalanceCellScreenProtocol?

    func delegate(delegate: BalanceCellScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var balanceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Conta", for: .normal)
        return button
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.text = "1.200,00 R$"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        self.configSuperView()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.balanceButton)
        self.addSubview(self.valueLabel)        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.balanceButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.balanceButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.balanceButton.heightAnchor.constraint(equalToConstant: 35),
            self.balanceButton.widthAnchor.constraint(equalToConstant: 35),
            
            self.valueLabel.topAnchor.constraint(equalTo: self.balanceButton.bottomAnchor, constant: 10),
            self.valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
            
        ])
    }
}

