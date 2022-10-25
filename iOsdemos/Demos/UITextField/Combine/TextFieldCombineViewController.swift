//
//  TextFieldCombineViewController.swift
//  iOsdemos
//
//  Created by Irvin Leon on 17/09/22.
//

import UIKit
import Combine

class TextFieldCombineViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    let textSubject = CurrentValueSubject<String, Never>("")
    var subscriptions = Set<AnyCancellable>()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        textField.textPublisher().sink{[unowned self] (value) in
//            textSubject.send(value)
//        }.store(in: &subscriptions)
//
//        textSubject.sink { [unowned self] (value) in
//            textField.text = value
//            label.text = value
//        }.store(in: &subscriptions)
        

        textField.createBinding(with: textSubject, storeIn: &subscriptions)
        
        textSubject.sink { [unowned self] (value) in
            label.text = value
        }.store(in: &subscriptions)
        
//        button.tapPublisher().sink {[unowned self] _ in
//            self.textSubject.send("")
//        }.store(in: &subscriptions)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
