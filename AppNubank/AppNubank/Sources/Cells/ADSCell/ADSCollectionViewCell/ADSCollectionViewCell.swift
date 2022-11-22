//
//  ADSCollectionViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 17/11/22.
//

import UIKit

enum ADSCollectionViewCellString: String {
    case identifier = "ADSCollectionViewCellScreen"
}

class ADSCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = ADSCollectionViewCellString.identifier.rawValue
    
    var ads:ADSCollectionViewCellScreen = ADSCollectionViewCellScreen()
    var data: [Ad] = []
    let viewModel: HomeViewModel = HomeViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubView()
        self.configConstraints()
//        self.configString1()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpCell(data: Ad) {
        self.ads.titlesLabel.text = data.adDescription
    }
    
    func configSubView() {
        self.ads.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.ads)
    }
    
    func configString1(data: Ad) {
        
        var text: String =  data.adDescription ?? ""
        let attributedString = NSMutableAttributedString.init(string: text)
        
        let range = NSString(string: text).range(of: "Black Friday", options: String.CompareOptions.caseInsensitive)

        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.purple,
            range: range)
        ads.titlesLabel.attributedText = attributedString
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.ads.topAnchor.constraint(equalTo: self.topAnchor),
            self.ads.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.ads.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.ads.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
