//
//  CreditCardTableViewCellScreen.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 17/11/22.
//

import UIKit


protocol CreditCardTableViewCellScreenProtocol: AnyObject {
    func actionCreditCard()
}

class CreditCardTableViewCellScreen: UIView {
    
    weak private var delegate: CreditCardTableViewCellScreenProtocol?

    func delegate(delegate: CreditCardTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = ""
        return label
    }()
    
    lazy var invoiceStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = ""
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = ""
        return label
    }()
    
    lazy var invoiceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = ""
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.setupConstraints()
    }
    
    func configSuperView() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.invoiceStatusLabel)
        self.addSubview(self.valueLabel)
        self.addSubview(self.invoiceDescriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.invoiceStatusLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            self.invoiceStatusLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.invoiceStatusLabel.heightAnchor.constraint(equalToConstant: 25),
            
            self.valueLabel.topAnchor.constraint(equalTo: self.invoiceStatusLabel.bottomAnchor, constant: 5),
            self.valueLabel.leadingAnchor.constraint(equalTo: self.invoiceStatusLabel.leadingAnchor),
            self.valueLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.invoiceDescriptionLabel.topAnchor.constraint(equalTo: self.valueLabel.bottomAnchor, constant: 5),
            self.invoiceDescriptionLabel.leadingAnchor.constraint(equalTo: self.valueLabel.leadingAnchor),
            self.invoiceDescriptionLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
}
