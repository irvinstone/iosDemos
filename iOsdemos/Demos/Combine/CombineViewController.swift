//
//  ViewController.swift
//  iOsdemos
//
//  Created by Irvin Leon on 6/09/22.
//

import UIKit
import Alamofire
import Combine

struct Post: Codable {
    let title: String
}

class CombineViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var posts: [Post] = []
    
    var observer: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        AF.request("https://jsonplaceholder.typicode.com/posts")
//            .validate()
//            .responseDecodable(of: [Post].self) { (response) in
//                guard let object = response.value else { return }
//                self.dataLabel.text = object.first?.title ?? "Empty"
//            }
        
//        let restManager = RestManager()
//        restManager.makeRequest(method: "GET", path: "/posts", query: [:], headers: [:], for: [Post].self) { (response) in
//
//            DispatchQueue.main.async {
//                self.dataLabel.text = response.first?.title ?? "Empty"
//            }
//        }
        
        observer = CombineRestManager.shared.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    print("finish")
                default :
                    print ("error")
                }
        }, receiveValue: {value in
            self.dataLabel.text = value.first?.title ?? "Empty"
        })
        
        dataLabel.text = "Default"
    }


}

