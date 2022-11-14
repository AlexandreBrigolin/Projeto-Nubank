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
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.signatureDelegate()
        viewModel.fetch(.request)
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
    }
    
    func error(_message: String) {
        print("Deu ruim \(_message)")
    }
    
    
}
extension HomeVC: UITableViewDelegate { }

extension  HomeVC: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
}
