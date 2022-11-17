//
//  LoanTableViewCell.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 17/11/22.
//

import UIKit

protocol LoanTableViewCellScreenProtocol: AnyObject {
    func actionloanCell()
}

class LoanTableViewCellScreen: UIView {
    
    weak private var delegate: LoanTableViewCellScreenProtocol?

    func delegate(delegate: LoanTableViewCellScreenProtocol?) {
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
    
    lazy var availableValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = ""
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = ""
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubView()
        self.configConstraints()
    }
    
    func configSubView() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.availableValueLabel)
        self.addSubview(self.valueLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            self.availableValueLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            self.availableValueLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.availableValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            self.valueLabel.topAnchor.constraint(equalTo: self.availableValueLabel.bottomAnchor, constant: 5),
            self.valueLabel.leadingAnchor.constraint(equalTo: self.availableValueLabel.leadingAnchor),
            self.valueLabel.heightAnchor.constraint(equalToConstant: 20),
        
        ])
    }
    
}
