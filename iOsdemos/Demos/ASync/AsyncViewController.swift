//
//  AsyncViewController.swift
//  iOsdemos
//
//  Created by Irvin Leon on 26/06/23.
//

import UIKit

class AsyncViewController: UIViewController {
    
    let serialQueue = DispatchQueue(label: "demo.serial.queue")
    let concurrentQueue = DispatchQueue(label: "demo.concurrent.queue", attributes: .concurrent)
    
    override func viewDidLoad() {
        /*
         MARK: - Serial
         */
        serialQueue.async {
            print("Start Serial 1")
            
            print("End Serieal 1")
        }
        
        serialQueue.async {
            print("Start Serial 2")
            
            print("End Serieal 2")
        }
        
        /*
         MARK: - Concurrent
         */
        concurrentQueue.async {
            print("Start Concurrent 1")
            
            print("End Concurrent 1")
        }
        
        concurrentQueue.async {
            print("Start Concurrent 2")
            
            print("End Concurrent 2")
        }
    }
}
