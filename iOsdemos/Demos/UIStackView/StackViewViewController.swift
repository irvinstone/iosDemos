//
//  StackViewViewController.swift
//  iOsdemos
//
//  Created by Irvin Leon on 17/10/22.
//

import UIKit

class StackViewViewController: UIViewController {
    
    private let containerView = UIView()
    
    private let titleLabel  = UILabel()
    private let titleIcon   = UIImageView()
    
    private let codeLabel   = UILabel()
    private let nameLabel   = UILabel()
    private let priceLabel  = UILabel()
    private let typeLabel   = UILabel()
    
    private var leftStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 8
        return view
    }()
    private var rightStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.alignment = .trailing
        view.spacing = 8
        return view
    }()
    
    private var containerStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.axis = .horizontal
        return view
    }()
    
    private let topStackview        = UIStackView()
    private let bodyStackview       = UIStackView()
    private let bottomStackview     = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setup()
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setup() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        
        leftStackView.addArrangedSubview(titleLabel)
        leftStackView.setCustomSpacing(20, after: titleLabel)
        leftStackView.addArrangedSubview(codeLabel)
        leftStackView.addArrangedSubview(nameLabel)
        
        rightStackView.addArrangedSubview(titleIcon)
        rightStackView.setCustomSpacing(20, after: titleIcon)
        rightStackView.addArrangedSubview(priceLabel)
        rightStackView.addArrangedSubview(typeLabel)
        
        
        containerStackView.addArrangedSubview(leftStackView)
        containerStackView.addArrangedSubview(rightStackView)
//        ContainerStackView.frame = containerView.bounds
        containerView.addSubview(containerStackView)
        view.addSubview(containerView)

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
//            containerStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
//            containerStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0)
//
            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        containerView.backgroundColor = .green
//        ContainerStackView.distribution = .fillEqually
//        ContainerStackView.axis = .vertical
        
        titleIcon.image = .remove
        titleIcon.contentMode = .scaleAspectFit
        titleLabel.text = "Title"
        codeLabel.text = "Code text"
        nameLabel.text = "Name Text "
        priceLabel.text = "price"
        typeLabel.text = "type"
    }

}
