//
//  AccountMovimentedCollectionViewCell.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 15/11/22.
//

import UIKit

enum AccountMovimentedCollectionViewCellString: String {
    case identifier = "AccountMovimentedCollectionViewCellScreen"
}

class AccountMovimentedCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = AccountMovimentedCollectionViewCellString.identifier.rawValue
    var data: [PaymentService] = []
    var accountMovimentedCollectionViewCellScreen: AccountMovimentedCollectionViewCellScreen = AccountMovimentedCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubView()
        self.configConstraints()
    }
    
    func setUpCell(data: PaymentService) {
        self.accountMovimentedCollectionViewCellScreen.imageView.image = UIImage(systemName: data.image ?? "")
        self.accountMovimentedCollectionViewCellScreen.movementLabel.text = data.name
    }
    
    func configSubView() {
        self.accountMovimentedCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.accountMovimentedCollectionViewCellScreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.accountMovimentedCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.accountMovimentedCollectionViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.accountMovimentedCollectionViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.accountMovimentedCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
}
