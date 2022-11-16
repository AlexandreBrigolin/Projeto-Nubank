//
//  LineTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 16/11/22.
//

import UIKit

class LineTableViewCell: UITableViewCell {
    
    static let identifier: String = "LineTableViewCell"
    
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
        self.backgroundColor = .red
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

