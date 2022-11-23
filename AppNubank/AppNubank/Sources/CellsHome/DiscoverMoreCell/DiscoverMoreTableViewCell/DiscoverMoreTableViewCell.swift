//
//  DiscoverMoreTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 18/11/22.
//

import UIKit

enum DiscoverMoreTableViewCellString: String {
    case identifier = "DiscoverMoreTableViewCell"
}

class DiscoverMoreTableViewCell: UITableViewCell {
    
    static let identifier: String = DiscoverMoreTableViewCellString.identifier.rawValue
    var discoverMoreTableViewCellScreen: DiscoverMoreTableViewCellScreen = DiscoverMoreTableViewCellScreen()
    var dataDiscover: [DiscoverMore] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSubView()
        self.configConstraints()
        self.discoverMoreTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    func configSubView() {
        self.discoverMoreTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.discoverMoreTableViewCellScreen)
    }
    
    public func dataCollection(data: TitleDiscover) {
        self.discoverMoreTableViewCellScreen.titleLabel.text = data.titleDiscoverMore ?? ""
        self.dataDiscover = data.discoverMore ?? []
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.discoverMoreTableViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.discoverMoreTableViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.discoverMoreTableViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.discoverMoreTableViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension DiscoverMoreTableViewCell: UICollectionViewDelegate {
}

extension DiscoverMoreTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataDiscover.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DiscoverMoreCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverMoreCollectionViewCell.identifier, for: indexPath) as? DiscoverMoreCollectionViewCell
        cell?.setUpCell(data: self.dataDiscover[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
}

extension DiscoverMoreTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 310, height: 280)
    }
}
