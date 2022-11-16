//
//  AccountMovimentedCollectionViewCellScreen.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 15/11/22.
//

import UIKit

class AccountMovimentedCollectionViewCellScreen: UIView {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
    }()
    
    lazy var movementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configConstraints()
    }
    
    func configSuperView() {
        self.addSubview(self.imageView)
        self.addSubview(self.movementLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            self.imageView.heightAnchor.constraint(equalToConstant: 30),
            self.imageView.bottomAnchor.constraint(equalTo: self.movementLabel.topAnchor, constant: -5),
            
            self.movementLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.movementLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            self.movementLabel.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
}
