//
//  HomeVC.swift
//  AppNubank
//
//  Created by Barbara Brigolin on 12/10/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    let  viewModel: HomeViewModel = HomeViewModel()
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell
        cell?.delegate(delegate: self)
        
        cell?.setupCell(data: viewModel.profileCell )
        
        return cell ?? ProfileTableViewCell()
    
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
