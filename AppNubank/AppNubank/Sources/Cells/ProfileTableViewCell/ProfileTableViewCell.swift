//
//  ProfileTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 14/11/22.

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier: String = "ProfileTableViewCell"
    
    weak private var delegate: ProfileTableViewCellScreenProtocol?

    func delegate(delegate: ProfileTableViewCellScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var screenViewModel = {
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
        self.contentView.addSubview(self.screenViewModel)
    }
    
    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            self.screenViewModel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screenViewModel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screenViewModel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screenViewModel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    public func setupCell(data: ProfileCell) {
        self.screenViewModel.logoAppImageView.image = UIImage(systemName: data.image ?? "")
        self.screenViewModel.personLabel.text = data.name
        
    }
}


