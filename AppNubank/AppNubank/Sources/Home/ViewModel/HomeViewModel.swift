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
                if let success = success {
                    self.homeData = success
                    self.delegate?.success()
                }else {
                    self.delegate?.error(_message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return 13
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat{
        switch HomeNameCell(rawValue: indexPath.row) {
        case .profile:
            return 90
        case .balance:
            return 70
        case .accountMovimented:
            return 120
        case .myCards:
            return 60
        case .line, .line2, .line3, .line4:
            return 1.5
        case .ads:
            return 90
        case .creditCard:
            return 115
        case .followAlso:
            return 110
        case .loan:
            return 80
        case .discoverMore:
            return 320
        default:
            return 0
        }
    }
    
    public var profileCell: ProfileCell {
        return homeData?.profileCell ?? ProfileCell()
    }
    
    public var balanceCell: AccountCell {
        return homeData?.accountCell ?? AccountCell()
    }
    
    public var myCardsCell: MyCards {
        return homeData?.myCards ?? MyCards()
    }
    
    public var accountMovimented: [PaymentService] {
        return homeData?.paymentServices ?? [PaymentService()]
    }
    public var adsCell: [Ad] {
        return homeData?.ads ?? [Ad()]
    }
    
    public var creditCard: CrediCardCell {
        return homeData?.crediCardCell ?? CrediCardCell()
    }
    
    public var followAso: FollowAlso {
        return homeData?.followAlso ?? FollowAlso()
    }
    
    public var loan: Loan {
        return homeData?.loan ?? Loan()
    }
    
    public var titleDiscover: TitleDiscover{
        return homeData?.titleDiscover ?? TitleDiscover()
    }
}
