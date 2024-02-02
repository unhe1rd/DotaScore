//
//  AlomafireNetworkService.swift
//  DotaScore
//
//  Created by Mike Ulanov on 05.01.2024.
//

import Alamofire
import Foundation

protocol NetworkService {
    
    func request(_ url: String, completion: @escaping (DataResponse<Data, AFError>) -> Void)
}

class AlamofireNetworkService: NetworkService {
    
    func request(_ url: String, completion: @escaping (DataResponse<Data, AFError>) -> Void) {
        AF.request(url).validate().responseData(completionHandler: completion)
    }
}
