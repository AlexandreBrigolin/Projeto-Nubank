//
//  Alert.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 12/10/22.
//

import Foundation
import UIKit

class Alert: NSObject {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (() -> Void)? = nil ) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel) { share in
            completion?()
        }
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true, completion: nil)
    }
    
}
