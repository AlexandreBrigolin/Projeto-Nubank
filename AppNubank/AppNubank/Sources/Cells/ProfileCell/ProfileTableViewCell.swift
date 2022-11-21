//
//  ProfileTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 14/11/22.

import UIKit

enum ProfileTableViewCellString: String {
    case identifier = "ProfileTableViewCell"
}

class ProfileTableViewCell: UITableViewCell {

    static let identifier: String = ProfileTableViewCellString.identifier.rawValue
    
    weak private var delegate: ProfileTableViewCellScreenProtocol?

    func delegate(delegate: ProfileTableViewCellScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var screen = {
        let view = ProfileTableViewCellScreen()
        view.delegate(delegate: self.delegate)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.setUpConstraintsScreenCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView(){
        self.contentView.addSubview(self.screen)
    }
    
    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    public func setupCell(data: ProfileCell) {
        self.screen.logoAppImageView.image = UIImage(systemName: data.image ?? "")
        self.screen.personLabel.text = data.name
        self.screen.eyeBalanceButton.setImage(UIImage(systemName: data.imageEye ?? ""), for: .normal)
        self.screen.doubtButton.setImage(UIImage(systemName: data.doubt ?? ""), for: .normal)
        self.screen.inviteFriendsButton.setImage(UIImage(systemName: data.referFriends ?? ""), for: .normal)
    }
}


