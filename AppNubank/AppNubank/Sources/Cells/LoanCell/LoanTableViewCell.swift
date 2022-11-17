//
//  LoanTableViewCell.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 17/11/22.
//

import UIKit

class LoanTableViewCell: UITableViewCell {
    
    static let identifier: String = "LoanTableViewCell"
    
    weak private var delegate: LoanTableViewCellScreenProtocol?

    func delegate(delegate: LoanTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var screen: LoanTableViewCellScreen = {
        let view = LoanTableViewCellScreen()
        view.delegate(delegate: self.delegate)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSubView()
        self.configConstraints()
    }
    
    func configSubView() {
        self.addSubview(self.screen)
    }
    
    public func setupCell(data: Loan) {
        screen.titleLabel.text = data.title ?? ""
        screen.availableValueLabel.text = data.availableValue ?? ""
        screen.valueLabel.text = String(" R$ \(data.loanAmount ?? 0),00")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
