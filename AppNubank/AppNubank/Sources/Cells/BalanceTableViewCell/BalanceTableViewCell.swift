//
//  BalanceCellVieModel.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {

    static let identifier: String = "BalanceTableViewCell"
    
    weak private var delegate: BalanceTableViewCellScreenProtocol?

    func delegate(delegate: BalanceTableViewCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var screen: BalanceTableViewCellScreen = {
        let view = BalanceTableViewCellScreen()
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
    
    public func setupCell(data: AccountCell) {
        screen.valueLabel.text = String(data.balance ?? 0.0)
        screen.balanceLabel.text = data.title ?? ""
    }

}
