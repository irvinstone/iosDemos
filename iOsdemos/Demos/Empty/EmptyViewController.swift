//
//  EmptyViewController.swift
//  iOsdemos
//
//  Created by Irvin Leon on 10/11/22.
//

import UIKit


public protocol Readable {
    func read() -> String
}

public extension Readable {
    func isReadable() -> Bool {
        return false
    }
}

public class ReadableObject: Readable {
    
    var val: String
    
    public init(val: String) {
        self.val = val
    }
    
    public func read() -> String {
        return val
    }
    
    public func isReadable() -> Bool {
        return true
    }
}

public class ReadOnceObject: Readable {
    
    var count: Int = 0
    
    public func read() -> String {
        return ""
    }
    
    public func isReadable() -> Bool {
        count += 1
        return count < 2
    }
}




class EmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("fuck")
        let readO = ReadOnceObject()
        print(readO.isReadable())
        print(readO.isReadable())
        print(readO.isReadable())
        print(readO.isReadable())
        print(readO.isReadable())
        
    }

}
