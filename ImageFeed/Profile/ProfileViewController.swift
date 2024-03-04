//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Pavel Popov on 18.02.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    //MARK: - Private constants
    private enum UIConstants {
        static let nameLabelFontSize: CGFloat = 16
        static let loginNameLabelFontSize: CGFloat = 13
        static let descriptionLabelFontSize: CGFloat = 13
    }
    
    //MARK: - Private properties
    private let avatarImageView: UIImageView = {
        let avatarImage = UIImage(named: "profile_photo")
        let view = UIImageView(image: avatarImage)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Екатерина Новикова"
        label.textColor = .white
        label.font = .systemFont(ofSize: UIConstants.nameLabelFontSize, weight: .bold)
        return label
    }()
    
    private let loginNameLabel: UILabel = {
       let label = UILabel()
        label.text = "@ekaterina_nov"
        label.textColor = .gray
        label.font = .systemFont(ofSize: UIConstants.loginNameLabelFontSize, weight: .regular)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = .white
        label.font = .systemFont(ofSize: UIConstants.descriptionLabelFontSize, weight: .regular)
        return label
    }()
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ipad.and.arrow.forward"), for: .normal)
        button.addTarget(self, action: #selector(didTapLogOutButton), for: .touchUpInside)
        button.tintColor = UIColor(red: 0.96, green: 0.41, blue: 0.42, alpha: 1)
        return button
    }()

    //MARK: - Private properties
    private func initialize() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        loginNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(loginNameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(logOutButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 70),
            avatarImageView.heightAnchor.constraint(equalToConstant: 70),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8),
            
            loginNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            loginNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 8),
            
            logOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -24),
            logOutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            logOutButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
    }
    
    @objc private func didTapLogOutButton() {
        print("TappedLogOutButton")
    }
}
