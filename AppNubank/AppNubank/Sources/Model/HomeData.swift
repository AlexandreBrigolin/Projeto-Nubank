//
//  dataJson.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/11/22.
//

import Foundation

// MARK: - HomeData
struct HomeData: Codable {
    let profileCell: ProfileCell
    let accountCell: AccountCell
    let paymentServices: [ProfileCell]
    let myCards: MyCards
    let ads: [Ad]
    let crediCardCell: CrediCardCell
    let followAlso: FollowAlso
    let loan: Loan
    let discoverMore: [DiscoverMore]
    
    enum CodingKeys: String, CodingKey {
        case profileCell = "profile_cell"
        case accountCell = "account_cell"
        case paymentServices = "payment_services"
        case myCards = "my_cards"
        case ads = "Ads"
        case crediCardCell = "credi_card_cell"
        case followAlso = "follow_also"
        case loan
        case discoverMore = "discover_more"
    }
}

// MARK: - AccountCell
struct AccountCell: Codable {
    let title: String
    let balance: Double
}

// MARK: - Ad
struct Ad: Codable {
    let adDescription: String
    
    enum CodingKeys: String, CodingKey {
        case adDescription = "description"
    }
}

// MARK: - CrediCardCell
struct CrediCardCell: Codable {
    let title, invoiceStatus: String
    let invoiceAmount: Int
    let invoiceDueDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case invoiceStatus = "invoice_status"
        case invoiceAmount = "invoice_amount"
        case invoiceDueDate = "invoice_due_date"
    }
}

// MARK: - DiscoverMore
struct DiscoverMore: Codable {
    let image: Image
    let title, discoverMoreDescription, titleButton: String
    
    enum CodingKeys: String, CodingKey {
        case image, title
        case discoverMoreDescription = "description"
        case titleButton = "title_button"
    }
}

enum Image: String, Codable {
    case person = "person"
}

// MARK: - FollowAlso
struct FollowAlso: Codable {
    let title: String
    let image: Image
    let paymentsAssistant: String
    
    enum CodingKeys: String, CodingKey {
        case title, image
        case paymentsAssistant = "payments_assistant"
    }
}

// MARK: - Loan
struct Loan: Codable {
    let title, availableValue: String
    let loanAmount: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case availableValue = "available_value"
        case loanAmount = "loan_amount"
    }
}

// MARK: - MyCards
struct MyCards: Codable {
    let myCardsDescription: String
    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case myCardsDescription = "description"
        case image
    }
}

// MARK: - ProfileCell
struct ProfileCell: Codable {
    let name: String
    let image: Image
}
