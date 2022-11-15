//
//  HomeViewModel.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/11/22.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

protocol HomeViewModelDelegate:AnyObject {
    func success()
    func error(_message: String)
}

class HomeViewModel {
    
    private let service: HomeService = HomeService()
    private weak var delegate: HomeViewModelDelegate?
    
    private var homeData: HomeData?
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: TypeFetch){
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
        return 1
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat{
        
        switch indexPath.row {
        case 0:
            return 90
        default:
            return 0
        }
    }
    
    
    public var profileCell: ProfileCell {
        return homeData?.profileCell ?? ProfileCell()
    }
    
    
    
    
    
}
