//
//  MyCardsTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

enum MyCardsTableViewCellString: String {
    case identifier = "MyCardsTableViewCell"
}

class MyCardsTableViewCell: UITableViewCell {
    
    static let identifier: String = MyCardsTableViewCellString.identifier.rawValue
    
    weak var delegate: MyCardsTableViewCellScreenProtocol?
    
    func delegate(delegate: MyCardsTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var screen: MyCardsTableViewCellScreen = {
        let view = MyCardsTableViewCellScreen()
        view.delegate(delegate: self.delegate)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
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
    
    public func setupCell(data: MyCards?) {
        self.screen.cardImageView.image = UIImage(systemName: data?.image ?? "")
        self.screen.descriptionLabel.text = data?.myCardsDescription
    }
    
}
