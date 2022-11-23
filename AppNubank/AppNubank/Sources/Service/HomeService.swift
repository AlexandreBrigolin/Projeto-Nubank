//
//  HomeService.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 12/11/22.
//

import Foundation
import Alamofire

protocol HomeServiceDelegate: GenericService{
    func getHomefromJson(completion: @escaping completion<HomeData?>)
    func getHome(completion: @escaping completion<HomeData?>)
}

class HomeService: HomeServiceDelegate {
    
    func getHome(completion: @escaping completion<HomeData?>){
        let url: String = "https://run.mocky.io/v3/4c599af9-e458-4604-a12f-e952cc310a44"
        
        AF.request(url, method: .get).validate().responseDecodable(of: HomeData.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getHomefromJson(completion: @escaping completion<HomeData?>) {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let menu: HomeData = try JSONDecoder().decode(HomeData.self, from: data)
                completion(menu, nil)
            }catch {
                completion(nil,Error.fileDecodingFailed(name: "data", error))
            }
        }
    }
}
