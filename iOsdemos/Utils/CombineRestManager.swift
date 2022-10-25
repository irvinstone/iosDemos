//
//  CombineRestManager.swift
//  iOsdemos
//
//  Created by Irvin Leon on 6/09/22.
//

import Foundation
import Combine
import Alamofire

class CombineRestManager {
    
    static let shared = CombineRestManager()
    
    func fetchPosts() -> Future<[Post],Error> {
        Future { promise in
            let manager = RestManager()
            manager.makeRequest(method: "GET", path: "/postss", query: [:], headers: [:], for: [Post].self) { (response) in
                promise(.success(response))
            }
        }
    }
    
    func fetchAPosts() -> Future<[Post],Error> {
        Future { promise in
            AF.request("https://jsonplaceholder.typicode.com/posts")
                .validate()
                .responseDecodable(of: [Post].self) { (response) in
                    
                }
        }
    }
}
