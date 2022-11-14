//
//  ScreemCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 14/11/22.
//

import UIKit

protocol ScreenCellProtocol: AnyObject {
    func actionEyeBalance()
    func actionDoubt()
    func actionInviteFriends()
}

class ScreemCell: UIView {

    weak private var delegate: ScreenCellProtocol?

    func delegate(delegate: ScreenCellProtocol?) {
        self.delegate = delegate
    }
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
    lazy var eyeBalanceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var doubtButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var inviteFriendsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var personLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.text = "Olá, Alexandre!"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        self.configSuperView()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.inviteFriendsButton)
        self.addSubview(self.eyeBalanceButton)
        self.addSubview(self.doubtButton)
        self.addSubview(self.personLabel)
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
        
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 35),
            self.logoAppImageView.widthAnchor.constraint(equalToConstant: 35),
            
            self.inviteFriendsButton.topAnchor.constraint(equalTo: self.logoAppImageView.topAnchor),
            self.inviteFriendsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.inviteFriendsButton.heightAnchor.constraint(equalToConstant: 35),
            self.inviteFriendsButton.widthAnchor.constraint(equalToConstant: 35),

            self.doubtButton.topAnchor.constraint(equalTo: self.inviteFriendsButton.topAnchor),
            self.doubtButton.trailingAnchor.constraint(equalTo: self.inviteFriendsButton.leadingAnchor, constant: -10),
            self.doubtButton.heightAnchor.constraint(equalToConstant: 35),
            self.doubtButton.widthAnchor.constraint(equalToConstant: 35),
            
            self.eyeBalanceButton.topAnchor.constraint(equalTo: self.doubtButton.topAnchor),
            self.eyeBalanceButton.trailingAnchor.constraint(equalTo: self.doubtButton.leadingAnchor, constant: -10),
            self.eyeBalanceButton.heightAnchor.constraint(equalToConstant: 35),
            self.eyeBalanceButton.widthAnchor.constraint(equalToConstant: 35),
            
            self.personLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 10),
            self.personLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
            
            
        
        
        ])
    }
    
    
}

