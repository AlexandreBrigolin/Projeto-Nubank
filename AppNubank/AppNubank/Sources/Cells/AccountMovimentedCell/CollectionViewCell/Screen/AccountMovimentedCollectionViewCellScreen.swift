//
//  AccountMovimentedCollectionViewCellScreen.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 15/11/22.
//

import UIKit

class AccountMovimentedCollectionViewCellScreen: UIView {
    
    lazy var viewBackgraund: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 50
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }()
    
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
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configConstraints()
    }
    
    func configSuperView() {
        self.addSubview(self.viewBackgraund)
        self.viewBackgraund.addSubview(self.imageView)
        self.viewBackgraund.addSubview(self.movementLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.viewBackgraund.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackgraund.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.viewBackgraund.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 100),
            self.viewBackgraund.widthAnchor.constraint(equalToConstant: 120),
            
            self.imageView.topAnchor.constraint(equalTo: self.viewBackgraund.topAnchor, constant: 5),
            self.imageView.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor, constant: 5),
            self.imageView.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor, constant: -5),
            self.imageView.heightAnchor.constraint(equalToConstant: 30),
            self.imageView.bottomAnchor.constraint(equalTo: self.movementLabel.topAnchor, constant: -5),
            
            self.movementLabel.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor, constant: 5),
            self.movementLabel.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor, constant: -5),
            self.movementLabel.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
}
