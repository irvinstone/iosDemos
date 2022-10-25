//
//  ViewController.swift
//  iOsdemos
//
//  Created by Irvin Leon on 6/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = StackViewViewController()
//        let vc = WithoutStoryBoardViewController()
        // Do any additional setup after loading the view.
        self.navigationController?.pushViewController(vc, animated: false)
    }
    



}

