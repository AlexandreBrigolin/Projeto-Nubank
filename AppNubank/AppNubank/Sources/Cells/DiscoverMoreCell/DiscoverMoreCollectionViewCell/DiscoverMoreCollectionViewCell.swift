//
//  DiscoverMoreCollectionViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 18/11/22.
//

import UIKit

enum DiscoverMoreCollectionViewCellString: String {
    case identifier = "DiscoverMoreCollectionViewCell"
}

class DiscoverMoreCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = DiscoverMoreCollectionViewCellString.identifier.rawValue
    var discoverMoreCollectionViewCellScreen: DiscoverMoreCollectionViewCellScreen = DiscoverMoreCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubView()
        self.configConstraints()
    }
    
    func setUpCell(data: DiscoverMore) {
        self.discoverMoreCollectionViewCellScreen.imageView.image = UIImage(systemName: data.image ?? "")
        self.discoverMoreCollectionViewCellScreen.titleImage.text = data.title ?? ""
        self.discoverMoreCollectionViewCellScreen.advertisementLabel.text = data.discoverMoreDescription ?? ""
        self.discoverMoreCollectionViewCellScreen.buttonLabel.text = data.titleButton
    }
    
    func configSubView() {
        self.discoverMoreCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.discoverMoreCollectionViewCellScreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.discoverMoreCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.discoverMoreCollectionViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.discoverMoreCollectionViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.discoverMoreCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
