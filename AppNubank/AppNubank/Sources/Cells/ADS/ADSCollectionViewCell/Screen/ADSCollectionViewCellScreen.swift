//
//  ADSCollectionViewCellScreen.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 17/11/22.
//

import UIKit

class ADSCollectionViewCellScreen: UIView {
    
    lazy var viewBackgraund: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }()
    
    lazy var titlesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configConstraints()
    }
    
    func configSuperView() {
        self.addSubview(viewBackgraund)
        self.viewBackgraund.addSubview(titlesLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstraints() {
        
        NSLayoutConstraint.activate([
        
            self.viewBackgraund.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.viewBackgraund.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.viewBackgraund.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.viewBackgraund.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            self.titlesLabel.topAnchor.constraint(equalTo: self.viewBackgraund.topAnchor, constant: 20),
            self.titlesLabel.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor, constant: 20),
            self.titlesLabel.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor, constant: -20),
            self.titlesLabel.bottomAnchor.constraint(equalTo: self.viewBackgraund.bottomAnchor, constant: -20)
        ])
    }

}
