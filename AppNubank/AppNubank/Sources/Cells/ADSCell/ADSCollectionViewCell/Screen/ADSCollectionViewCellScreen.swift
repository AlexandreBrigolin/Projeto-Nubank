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
        view.backgroundColor = .lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    lazy var titlesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
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
            
            self.viewBackgraund.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            self.viewBackgraund.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.viewBackgraund.heightAnchor.constraint(equalToConstant: 70),
            self.viewBackgraund.widthAnchor.constraint(equalToConstant: 330),

            self.titlesLabel.centerYAnchor.constraint(equalTo: self.viewBackgraund.centerYAnchor),
            self.titlesLabel.leadingAnchor.constraint(equalTo: self.viewBackgraund.leadingAnchor, constant: 10),
            self.titlesLabel.trailingAnchor.constraint(equalTo: self.viewBackgraund.trailingAnchor, constant: -10),
        ])
    }

}
