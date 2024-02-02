//
//  MainManager.swift
//  DotaScore
//
//  Created by Mike Ulanov on 05.01.2024.
//


import Alamofire
import Foundation

final class MainManager {
    static let shared = MainManager()
    private init(){}
    
    let networkService = AlamofireNetworkService()
    let baseURL = APIConstants.baseUrl
    
    func fetchData(id: Int, completion: @escaping (Result<MainNetworkModel, Error>) -> Void) {
        networkService.request(baseURL + "matches/\(id)") { response in
            switch response.result {
            case .success(let data):
                print(data)
                let decoder = JSONDecoder()
//                do {
//                    let dotaMatch = try decoder.decode(MainNetworkModel.self, from: data)
//                    print(dotaMatch)
//                    completion(.success(dotaMatch))
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)
                    }
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

