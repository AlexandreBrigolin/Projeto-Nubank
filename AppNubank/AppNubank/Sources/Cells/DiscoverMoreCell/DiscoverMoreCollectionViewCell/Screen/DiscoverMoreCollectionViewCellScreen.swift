//
//  DiscoverMoreCollectionViewCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 18/11/22.
//

import UIKit

class DiscoverMoreCollectionViewCellScreen: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var viewBackgraund: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
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
    
    lazy var titleImage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var advertisementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.viewBackgraund)
        self.viewBackgraund.addSubview(self.imageView)
        self.viewBackgraund.addSubview(self.titleImage)
        self.viewBackgraund.addSubview(self.advertisementLabel)
        self.viewBackgraund.addSubview(self.buttonLabel)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.viewBackgraund.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.viewBackgraund.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: 20),
            self.viewBackgraund.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: -20),
            self.viewBackgraund.bottomAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: -20),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 400),
            self.viewBackgraund.widthAnchor.constraint(equalToConstant: 390),
            
            self.imageView.topAnchor.constraint(equalTo: self.viewBackgraund.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 150),
            
            self.titleImage.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 10),
            self.titleImage.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 10),
            self.titleImage.heightAnchor.constraint(equalToConstant: 30),
            
            self.advertisementLabel.topAnchor.constraint(equalTo: self.titleImage.topAnchor, constant: 10),
            self.advertisementLabel.leadingAnchor.constraint(equalTo: self.titleImage.leadingAnchor, constant: 10),
            self.advertisementLabel.trailingAnchor.constraint(equalTo: self.titleImage.trailingAnchor, constant: -10),
            self.advertisementLabel.heightAnchor.constraint(equalToConstant: 60),
            
            self.buttonLabel.topAnchor.constraint(equalTo: self.advertisementLabel.topAnchor, constant: 10),
            self.buttonLabel.leadingAnchor.constraint(equalTo: self.advertisementLabel.leadingAnchor, constant: 10),
            self.buttonLabel.heightAnchor.constraint(equalToConstant: 40),

        ])
        
    }

    
}
