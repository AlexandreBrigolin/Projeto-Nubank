//
//  BalanceViewController.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 15/11/22.
//

import UIKit

class BalanceViewController: UIViewController {

    var homeScreen: HomeScreen?
    let viewModel: BalanceViewModel = BalanceViewModel()
    
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.signatureDelegate()
        viewModel.fetch(.request)

    }
        
    private func signatureDelegate() {
        viewModel.delegateBalance(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension BalanceViewController: BalanceViewModelDelegate {
    func success() {
        print("Deu certo!")
    }
    
    func error(_message: String) {
        print("Deu Ruin \(_message)")
    }
    
    
}

extension BalanceViewController: UITableViewDelegate { }

extension BalanceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BalanceCellVieModel.identifier, for: indexPath) as?  BalanceCellVieModel
        cell?.delegate(delegate: self)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
}

extension BalanceViewController: BalanceCellScreenProtocol{
    func actionBalance() {
        print(#function)
    }
}


