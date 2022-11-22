//
//  dataJson.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/11/22.
//

import Foundation

// MARK: - HomeData
struct HomeData: Codable {
    var profileCell: ProfileCell?
    var accountCell: AccountCell?
    var paymentServices: [PaymentService]?
    var myCards: MyCards?
    var ads: [Ad]?
    var crediCardCell: CrediCardCell?
    var followAlso: FollowAlso?
    var loan: Loan?
    var titleDiscover: TitleDiscover?
    
    
    enum CodingKeys: String, CodingKey {
        case profileCell = "profile_cell"
        case accountCell = "account_cell"
        case paymentServices = "payment_services"
        case myCards = "my_cards"
        case ads = "Ads"
        case crediCardCell = "credi_card_cell"
        case followAlso = "follow_also"
        case loan
        case titleDiscover = "title_discover"
        
    }
}

// MARK: - AccountCell
struct AccountCell: Codable {
    var title: String?
    var balance: Int?
}

// MARK: - Ad
struct Ad: Codable {
    var adDescription: String?
    var highlightedText: String?
    
    enum CodingKeys: String, CodingKey {
        case adDescription = "description"
        case highlightedText = "highlighted_text"
    }
}

// MARK: - CrediCardCell
struct CrediCardCell: Codable {
    var title, invoiceStatus: String?
    var invoiceAmount: Int?
    var invoiceDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case invoiceStatus = "invoice_status"
        case invoiceAmount = "invoice_amount"
        case invoiceDescription = "invoice_description"
    }
}

// MARK: - TitleDiscover
struct TitleDiscover: Codable {
    var titleDiscoverMore: String?
    var discoverMore: [DiscoverMore]?
    
    enum CodingKeys: String, CodingKey {
        case titleDiscoverMore = "title_discover_more"
        case discoverMore = "discover_more"
    }
}

// MARK: - DiscoverMore
struct DiscoverMore: Codable {
    var image: String?
    var title, discoverMoreDescription, titleButton: String?
    
    enum CodingKeys: String, CodingKey {
        case image, title
        case discoverMoreDescription = "description"
        case titleButton = "title_button"
    }
}

// MARK: - FollowAlso
struct FollowAlso: Codable {
    var title: String?
    var image: String?
    var paymentsAssistant: String?
    
    enum CodingKeys: String, CodingKey {
        case title, image
        case paymentsAssistant = "payments_assistant"
    }
}

// MARK: - Loan
struct Loan: Codable {
    var title, availableValue: String?
    var loanAmount: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case availableValue = "available_value"
        case loanAmount = "loan_amount"
    }
}

// MARK: - MyCards
struct MyCards: Codable {
    var myCardsDescription: String?
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case myCardsDescription = "description"
        case image
    }
}

// MARK: - ProfileCell
struct ProfileCell: Codable {
    var name, image, imageEye, imageEyeSlash: String?
    var doubt, referFriends: String?
    
    enum CodingKeys: String, CodingKey {
        case name, image
        case imageEye = "image_eye"
        case imageEyeSlash = "image_eye_slash"
        case doubt
        case referFriends = "refer_friends"
    }
}

// MARK: - PaymentService
struct PaymentService: Codable {
    var name, image: String?
}
