//
//  ViewController.swift
//  iOsdemos
//
//  Created by Irvin Leon on 6/09/22.
//

import UIKit
import SwiftUI

protocol SetupViews {
    func setup()
    func style()
    func layout()
    func actions()
}
extension SetupViews {
    func style() {}
    func layout() {}
}

class WithoutStoryBoardViewController: UIViewController {
    
    let shadowView = UIImageView()
    let imageView = UIImageView(image: UIImage(named: "ornamento"))
    let locationButtom = UIButton()
    let searchTextfield = UITextField()
    let searchButtom = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
        
    }
}

extension WithoutStoryBoardViewController: SetupViews {
    func setup() {
        
        style()
        layout()
        actions()
        
    }
    
    func style() {
        
        view.backgroundColor = .yellow
        
        shadowView.backgroundColor = .green
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.alpha = 0.6
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        locationButtom.translatesAutoresizingMaskIntoConstraints = false
        locationButtom.setBackgroundImage(UIImage(systemName: "location.circle"), for: .normal)
        locationButtom.tintColor = .label
        
        searchButtom.translatesAutoresizingMaskIntoConstraints = false
        searchButtom.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButtom.setBackgroundImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .highlighted)
        searchButtom.tintColor = .label
        
        searchTextfield.translatesAutoresizingMaskIntoConstraints = false
        searchTextfield.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextfield.placeholder = "Search"
        searchTextfield.textAlignment = .right
        searchTextfield.borderStyle = .roundedRect
        searchTextfield.backgroundColor = .systemFill
        
    }
    
    func layout() {
        
        view.addSubview(shadowView)
        view.addSubview(locationButtom)
        view.addSubview(searchTextfield)
        view.addSubview(searchButtom)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: view.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationButtom.widthAnchor.constraint(equalToConstant: 44),
            locationButtom.heightAnchor.constraint(equalToConstant: 44),
            locationButtom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            locationButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationButtom.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            
            searchButtom.widthAnchor.constraint(equalToConstant: 44),
            searchButtom.heightAnchor.constraint(equalToConstant: 44),
            searchButtom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            searchButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchButtom.trailingAnchor, multiplier: 1),
            
            searchTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            searchTextfield.leadingAnchor.constraint(equalToSystemSpacingAfter: locationButtom.trailingAnchor, multiplier: 1),
            searchButtom.leadingAnchor.constraint(equalToSystemSpacingAfter: searchTextfield.trailingAnchor, multiplier: 1),
//            searchTextfield.trailingAnchor.constraint(equalToSystemSpacingAfter: searchButtom.leadingAnchor, multiplier: 1),
    
        ])
        
        
    }
    
    func actions() {
        searchButtom.addTarget(self, action: #selector(searchAction(sender:)), for: .touchDown)
    }
    
    @objc func searchAction(sender: UIButton!) {
        print("fuck")
    }
    
    
}
