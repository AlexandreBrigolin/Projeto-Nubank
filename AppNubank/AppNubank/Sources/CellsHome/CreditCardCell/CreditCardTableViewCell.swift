//
//  CreditCardTableViewCell.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 17/11/22.
//

import UIKit

enum CreditCardTableViewCellString: String {
    case identifier = "CreditCardTableViewCell"
}

class CreditCardTableViewCell: UITableViewCell {
    
    static let identifier: String = CreditCardTableViewCellString.identifier.rawValue
    
    weak private var delegate: CreditCardTableViewCellScreenProtocol?
    
    func delegate(delegate: CreditCardTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var screen: CreditCardTableViewCellScreen = {
        let view = CreditCardTableViewCellScreen()
        view.delegate(delegate: self.delegate)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.configSuperView()
        self.setUpConstraintsScreenCell()
    }
    
    func configSuperView() {
        self.addSubview(self.screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: CrediCardCell) {
        screen.titleLabel.text = data.title ?? ""
        screen.invoiceStatusLabel.text = data.invoiceStatus ?? ""
        screen.valueLabel.text = String(" R$ \(data.invoiceAmount ?? 0),00")
        screen.invoiceDescriptionLabel.text = data.invoiceDescription ?? ""
    }
    
    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
