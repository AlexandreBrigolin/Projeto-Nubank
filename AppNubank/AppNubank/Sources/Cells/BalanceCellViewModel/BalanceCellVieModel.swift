//
//  BalanceCellVieModel.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

class BalanceCellVieModel: UITableViewCell {

    static let identifier: String = "BalanceCellVieModel"
    
    weak private var delegate: BalanceCellScreenProtocol?

    func delegate(delegate: BalanceCellScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var screenBalanceViewModel: BalanceCellScreen = {
        let view = BalanceCellScreen()
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
        self.contentView.addSubview(self.screenBalanceViewModel)
    }

    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            self.screenBalanceViewModel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screenBalanceViewModel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screenBalanceViewModel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screenBalanceViewModel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
