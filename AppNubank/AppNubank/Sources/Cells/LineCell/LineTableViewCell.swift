//
//  LineTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 16/11/22.
//

import UIKit

enum LineTableViewCellString: String {
    case identifier = "LineTableViewCell"
}

class LineTableViewCell: UITableViewCell {
    
    static let identifier: String = LineTableViewCellString.identifier.rawValue
    
    weak var delegate: LineTableViewCellScreenProtocol?
    
    func delegate(delegate: LineTableViewCellScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var screen: LineTableViewCellScreen = {
        let screen = LineTableViewCellScreen()
        screen.delegate(delegate: self.delegate)
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
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
    
}

