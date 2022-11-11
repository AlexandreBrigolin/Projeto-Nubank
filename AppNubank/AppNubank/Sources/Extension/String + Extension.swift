//
//  UITextField + Extension.swift
//  AppNubank
//
//  Created by Caio Fabrini on 22/10/22.
//

import Foundation
import UIKit

public enum ValidType {
    case email
    case password
}

extension String {
    
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = ".{6,}"
    }
    
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        return NSPredicate(format:format, regex).evaluate(with: self)
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
    
    func getDateFormat(getFormatDate:String,setFormatDate:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = getFormatDate
        
        let setDateFormatter = DateFormatter()
        setDateFormatter.dateFormat = setFormatDate
        setDateFormatter.locale = NSLocale.init(localeIdentifier: "pt-br") as Locale
        setDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let date = dateFormatter.date(from: self) else {return ""}
        let novaData = setDateFormatter.string(from: date)
        
        return novaData
    }
    
    func getDate(getFormatDate:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = getFormatDate
        dateFormatter.locale = NSLocale.init(localeIdentifier: "pt-br") as Locale
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date = dateFormatter.date(from: self) else {return Date()}
        return date
    }
    
    
}

extension UIViewController {
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
