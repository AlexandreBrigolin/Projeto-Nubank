//
//  LineTableViewCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 16/11/22.
//

import UIKit
protocol LineTableViewCellScreenProtocol: AnyObject {
    func actionLineCell()
}

class LineTableViewCellScreen: UIView {
    
    weak var delegate: LineTableViewCellScreenProtocol?
    
    func delegate(delegate: LineTableViewCellScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var lineView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.lineView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            
        ])
    }
    
}
