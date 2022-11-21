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
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightGray.withAlphaComponent(0.17)
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
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
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
        self.addSubview(self.movementLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.viewBackgraund.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 5),
            self.viewBackgraund.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 60),
            self.viewBackgraund.widthAnchor.constraint(equalToConstant: 60),
        
            self.imageView.centerXAnchor.constraint(equalTo: self.viewBackgraund.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.viewBackgraund.centerYAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 25),

            
            self.movementLabel.topAnchor.constraint(equalTo: self.viewBackgraund.bottomAnchor, constant: 4),
            self.movementLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.movementLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.movementLabel.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
}
