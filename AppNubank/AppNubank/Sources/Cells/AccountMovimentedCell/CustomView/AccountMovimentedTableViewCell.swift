//
//  AccountMovimentedTableViewCell.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 15/11/22.
//

import UIKit

class AccountMovimentedTableViewCell: UITableViewCell {
    
    var accountMovimentedTableViewCellScreen: AccountMovimentedTableViewCellScreen = AccountMovimentedTableViewCellScreen()
    var data: [ProfileCell] = []
    let viewModel: HomeViewModel = HomeViewModel()
    
    static let identifier: String = "AccountMovimentedTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSubView()
        self.configConstraintsAccountMovimentedTableViewCellScreen()
        self.accountMovimentedTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    
    func configSubView() {
        self.accountMovimentedTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.accountMovimentedTableViewCellScreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func dataCollection(data: [ProfileCell]) {
        self.data = data
        
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
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: AccountMovimentedCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: AccountMovimentedCollectionViewCell.identifier, for: indexPath) as? AccountMovimentedCollectionViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
}

extension AccountMovimentedTableViewCell: UICollectionViewDelegate {
    
}

extension AccountMovimentedTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: 90)
    }
    
}

