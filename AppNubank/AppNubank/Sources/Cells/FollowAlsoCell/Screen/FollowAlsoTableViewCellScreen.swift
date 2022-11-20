//
//  FollowAlsoTableViewCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

protocol FollowAlsoTableViewCellScreenProtocol: AnyObject {
    func actionMyCards()
}

class FollowAlsoTableViewCellScreen: UIView {

    weak private var delegate: FollowAlsoTableViewCellScreenProtocol?

    func delegate(delegate: FollowAlsoTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
    
    lazy var sifraImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
    }()
    
    lazy var assistentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.viewBackgraund)
        self.viewBackgraund.addSubview(self.sifraImageView)
        self.viewBackgraund.addSubview(self.assistentLabel)

    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            self.viewBackgraund.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.viewBackgraund.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.viewBackgraund.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 80),
            
            self.sifraImageView.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor, constant: 10),
            self.sifraImageView.centerYAnchor.constraint(equalTo: self.viewBackgraund.centerYAnchor),
            
            self.assistentLabel.leadingAnchor.constraint(equalTo: self.sifraImageView.trailingAnchor, constant: 10),
            self.assistentLabel.centerYAnchor.constraint(equalTo: self.viewBackgraund.centerYAnchor)
  
        ])
    }
}


