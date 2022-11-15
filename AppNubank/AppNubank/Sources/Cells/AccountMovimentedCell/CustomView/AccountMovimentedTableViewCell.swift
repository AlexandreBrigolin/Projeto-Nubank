//
//  AccountMovimentedTableViewCell.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 15/11/22.
//

import UIKit

class AccountMovimentedTableViewCell: UITableViewCell {
    
    var accountMovimentedTableViewCellScreen: AccountMovimentedTableViewCellScreen = AccountMovimentedTableViewCellScreen()
    
    static let identifier: String = "AccountMovimentedTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSubView()
        self.configConstraintsAccountMovimentedTableViewCellScreen()
    }
    

    func configSubView() {
        self.accountMovimentedTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.accountMovimentedTableViewCellScreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraintsAccountMovimentedTableViewCellScreen() {
        NSLayoutConstraint.activate([
            
            self.accountMovimentedTableViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.accountMovimentedTableViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.accountMovimentedTableViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.accountMovimentedTableViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension AccountMovimentedTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}


extension AccountMovimentedTableViewCell: UICollectionViewDelegate {
    
    
}

// fazer os dados da collection
