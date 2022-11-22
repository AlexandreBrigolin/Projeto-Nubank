//
//  ADSTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 17/11/22.
//

import UIKit

enum ADSTableViewCellString: String {
    case identifier = "ADSTableViewCell"
}



class ADSTableViewCell: UITableViewCell {

    var aADSTableViewCellScreen: ADSTableViewCellScreen = ADSTableViewCellScreen()
    var data: [Ad] = []
    
    static let identifier: String = ADSTableViewCellString.identifier.rawValue
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSubView()
        self.configConstraints()
        self.aADSTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    
    func configSubView() {
        self.aADSTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.aADSTableViewCellScreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func dataCollection(data: [Ad]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.aADSTableViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.aADSTableViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.aADSTableViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.aADSTableViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ADSTableViewCell: UICollectionViewDelegate { }
extension ADSTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ADSCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: ADSCollectionViewCell.identifier, for: indexPath) as? ADSCollectionViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
extension ADSTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 340, height: 85)
    }
    
}

