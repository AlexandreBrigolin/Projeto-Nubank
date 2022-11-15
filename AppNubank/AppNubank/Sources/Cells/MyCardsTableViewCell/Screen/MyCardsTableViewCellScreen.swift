//
//  MyCardsTableViewCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

protocol MyCardsTableViewCellScreenProtocol: AnyObject {
    func actionMyCards()
}

class MyCardsTableViewCellScreen: UIView {

    weak private var delegate: MyCardsTableViewCellScreenProtocol?

    func delegate(delegate: MyCardsTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var cardImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        self.addSubview(self.cardImageView)
        self.addSubview(self.descriptionLabel)
// criar backGround view chamar do add subview em primeiro lugar e adicionar os elementos dentro da mesma!
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.cardImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.cardImageView.heightAnchor.constraint(equalToConstant: 35),
            self.cardImageView.widthAnchor.constraint(equalToConstant: 35),
            
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.cardImageView.trailingAnchor, constant: 20),
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           
        ])
    }
}

