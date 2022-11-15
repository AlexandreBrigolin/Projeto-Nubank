//
//  BalanceViewModel.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

enum Fetch {
    case mock
    case request
}

protocol BalanceViewModelDelegate:AnyObject {
    func success()
    func error(_message: String)
}

class BalanceViewModel {
    
    private let service: HomeService = HomeService()
    private weak var delegate: BalanceViewModelDelegate?
    
    private var homeData: HomeData?
    
    public func delegateBalance(delegate: BalanceViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: Fetch){
        switch typeFetch {
        case.mock:
            self.service.getHomefromJson { sucess, error in
                if let sucess = sucess {
                    self.homeData = sucess
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
                
            }
        case.request:
            self.service.getHome { success, error in
                if let error = error {
                    self.delegate?.error(_message: error.localizedDescription)
                }else {
                    self.delegate?.success()
                }
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return 2
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat{
        
        switch indexPath.row {
        case 1:
            return 90
        default:
            return 0
        }
    }
}
