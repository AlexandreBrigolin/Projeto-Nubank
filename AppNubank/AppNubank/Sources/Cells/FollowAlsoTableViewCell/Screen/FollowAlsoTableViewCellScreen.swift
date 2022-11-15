//
//  FollowAlsoTableViewCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

class FollowAlsoTableViewCellScreen: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var sifraImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
    lazy var assistentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.configSuperView()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.sifraImageView)
        self.addSubview(self.assistentLabel)

    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 35),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 35),
            
            self.sifraImageView.leadingAnchor.constraint(equalTo: self.sifraImageView.trailingAnchor, constant: 20),
            self.sifraImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           
        ])
    }
}


