//
//  HomeVC.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 12/10/22.
//

import UIKit

enum HomeNameCell: Int {
    case profile = 0
    case balance = 1
    case myCards = 2
    case line = 3
}

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    let viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        self.signatureDelegate()
        viewModel.fetch(.mock)
    }
    
    private func signatureDelegate() {
        viewModel.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
extension HomeVC: HomeViewModelDelegate {
    func success() {
        print("Deu certo")
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    func error(_message: String) {
        print("Deu ruim \(_message)")
    }
}

extension HomeVC: UITableViewDelegate{  }

extension  HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // primeira abordagem
        
//        if indexPath.row == 0 {
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell
//            cell?.delegate(delegate: self)
//            cell?.setupCell(data: viewModel.profileCell)
//            return cell ?? UITableViewCell()
//
//        } else if indexPath.row == 1 {
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: BalanceTableViewCell.identifier, for: indexPath) as? BalanceTableViewCell
//            cell?.setupCell(data: viewModel.balanceCell)
//            return cell ?? UITableViewCell()
//
//        }
//        return UITableViewCell()
        
        
        // segunda abordagem
        
//        switch indexPath.row {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell
//            cell?.delegate(delegate: self)
//            cell?.setupCell(data: viewModel.profileCell)
//            return cell ?? UITableViewCell()
//
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: BalanceTableViewCell.identifier, for: indexPath) as? BalanceTableViewCell
//            cell?.setupCell(data: viewModel.balanceCell)
//            return cell ?? UITableViewCell()
//
//        default:
//            return UITableViewCell()
//        }
        
        // terceira abordagem
        
        switch HomeNameCell(rawValue: indexPath.row) {
        case .profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell
            cell?.delegate(delegate: self)
            cell?.setupCell(data: viewModel.profileCell)
            return cell ?? UITableViewCell()
        case .balance:
            let cell = tableView.dequeueReusableCell(withIdentifier: BalanceTableViewCell.identifier, for: indexPath) as? BalanceTableViewCell
            cell?.setupCell(data: viewModel.balanceCell)
            return cell ?? UITableViewCell()
        case .myCards:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyCardsTableViewCell.identifier, for: indexPath) as? MyCardsTableViewCell
            cell?.setupCell(data: viewModel.myCardsCell)
            return cell ?? UITableViewCell()
        case.line:
            let cell = tableView.dequeueReusableCell(withIdentifier: LineTableViewCell.identifier, for: indexPath) as? LineTableViewCell
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
}

extension HomeVC: ProfileTableViewCellScreenProtocol {
    func actionEyeBalance() {
        print(#function)
    }
    
    func actionDoubt() {
        print(#function)
    }
    
    func actionInviteFriends() {
        print(#function)
    }
}
