//
//  DiscoverMoreCollectionViewCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 18/11/22.
//

import UIKit

class DiscoverMoreCollectionViewCellScreen: UIView {

    
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
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var advertisementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .purple
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configConstraints()
    }
    
    func configSuperView() {
//        self.addSubview(self.titleLabel)
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
            
            self.viewBackgraund.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackgraund.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.viewBackgraund.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 290),
            self.viewBackgraund.widthAnchor.constraint(equalToConstant: 350),
            
            self.imageView.topAnchor.constraint(equalTo: self.viewBackgraund.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 130),
            
            self.titleImage.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.titleImage.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor, constant: 10),
            self.titleImage.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor, constant: -5),
            self.titleImage.heightAnchor.constraint(equalToConstant: 25),
            
            self.advertisementLabel.topAnchor.constraint(equalTo: self.titleImage.bottomAnchor, constant: 5),
            self.advertisementLabel.leadingAnchor.constraint(equalTo: self.titleImage.leadingAnchor),
            self.advertisementLabel.trailingAnchor.constraint(equalTo: self.titleImage.trailingAnchor),
            self.advertisementLabel.heightAnchor.constraint(equalToConstant: 70),
            
            self.buttonLabel.topAnchor.constraint(equalTo: self.advertisementLabel.bottomAnchor, constant: 5),
            self.buttonLabel.leadingAnchor.constraint(equalTo: self.advertisementLabel.leadingAnchor),
            self.buttonLabel.widthAnchor.constraint(equalToConstant: 160),
            self.buttonLabel.heightAnchor.constraint(equalToConstant: 40),

        ])
        
    }

    
}
