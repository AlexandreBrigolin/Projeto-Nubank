//
//  ADSCollectionViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 17/11/22.
//

import UIKit

class ADSCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ADSCollectionViewCellScreen"
    
    var ads:ADSCollectionViewCellScreen = ADSCollectionViewCellScreen()
    var data: [Ad] = []
    let viewModel: HomeViewModel = HomeViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubView()
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(data: Ad) {
        self.ads.titlesLabel.text = data.adDescription
    }
    
    func configSubView() {
        self.ads.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.ads)
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.ads.topAnchor.constraint(equalTo: self.topAnchor),
            self.ads.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.ads.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.ads.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
