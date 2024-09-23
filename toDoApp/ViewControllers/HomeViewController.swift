//
//  ViewController.swift
//  toDoApp
//
//  Created by iOS Developer on 31/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var layer: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsaConstants.layer))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var character: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsaConstants.homeIllustration))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Manage your tasks"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "You can easily manage all of your daily tasks in DoMe for free"
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white //UIColor(named: AssetsaConstants.darkPurple)
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        button.setTitleColor(UIColor(named: AssetsaConstants.darkblue), for: .normal)
        button.layer.cornerRadius = 12
        button.tintColor = .purple
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: AssetsaConstants.darkPurple)
        addSubViews()
        setupConstrainst()
    }
    
    @objc func buttonPressed(){
        navigationController?.pushViewController(MenuViewController(), animated: true)
    }
    
    private func addSubViews(){
        view.addSubview(layer)
        view.addSubview(character)
        view.addSubview(titleLabel)
        view.addSubview(label)
        view.addSubview(button)
    }
    
    private func setupConstrainst(){
        NSLayoutConstraint.activate([
            
            layer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            layer.heightAnchor.constraint(equalToConstant: 142),
            layer.widthAnchor.constraint(equalToConstant: 310),
            layer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    
            character.heightAnchor.constraint(equalToConstant: 186),
            character.widthAnchor.constraint(equalToConstant: 186),
            character.bottomAnchor.constraint(equalTo: layer.bottomAnchor, constant: 160),
            character.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: character.bottomAnchor, constant: 42),
            titleLabel.centerXAnchor.constraint(equalTo: character.centerXAnchor),
            
            label.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 62),
            label.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -36),
            button.widthAnchor.constraint(equalToConstant: 264),
            button.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
        ])
    }


}

