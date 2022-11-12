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
    
    
    
    
    public func fetch(_ typeFetch: TypeFetch){
        switch typeFetch {
        case.mock:
            self.service.getHomefromJson { sucess, error in
                print(sucess)
            }
        case.request:
            self.service.getHome { success, error in
                print(success)
            }
        }
    }
    
}
