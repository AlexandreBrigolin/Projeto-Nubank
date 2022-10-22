//
//  CustomTableViewCell.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/10/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject{
    func actionRegisterButton(user: User)
}

class CustomTableViewCell: UITableViewCell {
    
    
    static let identifier: String = "CustomTableViewCell"
    
    lazy var screenCell: ScreenTableViewCell = {
        let view = ScreenTableViewCell()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configBackGround()
        self.addSubView()
        self.setUpConstraintsScreenCell()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configBackGround() {
        self.contentView.backgroundColor = UIColor(red: 126/255, green: 26/255, blue: 183/255, alpha: 1.0)
    }
    

    func addSubView(){
        self.contentView.addSubview(self.screenCell)        
    }
    
    
    private func setUpConstraintsScreenCell() {
        NSLayoutConstraint.activate([
            self.screenCell.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screenCell.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screenCell.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screenCell.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
extension CustomTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODA A LOGICA DEVE SER FEITA NO DID END (LOGICA DE VALIDACAO)
        print("textFieldDidEndEditing")
       
    }
    
}

//extension UITextField {
//    
//    func validateEmail()->Bool{
//        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+//.[A-Za-z]{2,64}"
//        let validadteRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
//        return validadteRegex.evaluate(with: self.text)
//    }
//    
//    func validatePassword()->Bool{
//        let passwordRegex: String = ".{6,}"
//        let validadteRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//        return validadteRegex.evaluate(with: self.text)
//    }
//}
