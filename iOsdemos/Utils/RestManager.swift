//
//  RestManager.swift
//  Techtest
//
//  Created by Irvin Leon on 29/07/22.
//

import Foundation

class RestManager {
    let base_host = "https://jsonplaceholder.typicode.com"
    let decoder = JSONDecoder()
    
    static let Shared = RestManager()
    
    func makeRequest<T,E>(method: String,path: String,query: [String:Any],body: E?,headers: [String:String],for type: T.Type,_ callback: @escaping (_ coded: T) -> Void) -> Void  where T: Codable , E: Codable {
        
        let queryString = query.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")

        let url = URL(string: base_host + path + "?" + queryString)
        guard let completeUrl = url else {
            fatalError("url malformed")
        }
        
        var request = URLRequest(url: completeUrl)
        request.httpMethod = method

        headers.forEach{ key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        if let jsonData = Coder.Shared.encode(toEncode: body) {
            request.httpBody = jsonData
        }
        
        sendHttpRequest(request: request, for: type, { respone in
            callback(respone)
        })
        
        
    }
    
    func makeRequest<T>(method: String,path: String,query: [String:Any],headers: [String:String],for type: T.Type,_ callback: @escaping (_ coded: T) -> Void) -> Void  where T: Codable {
        
        let queryString = query.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")

        let url = URL(string: (base_host + path + "?" + queryString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        guard let completeUrl = url else {
            fatalError("url malformed")
        }
        var request = URLRequest(url: completeUrl)
        request.httpMethod = method

        headers.forEach{ key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        sendHttpRequest(request: request, for: type, { respone in
            callback(respone)
        })
        
        
    }
    
    
    private func sendHttpRequest<T>(request: URLRequest, for type: T.Type,_ callback: @escaping (_ coded: T) -> Void) -> Void  where T: Codable {

        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                return
            }
            if let decoded = Coder.Shared.decode(for: type, toDecode: data) {
                callback(decoded)
            }
        }
        task.resume()
    }
    
    
    
    
    
}
