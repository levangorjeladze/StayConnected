//
//  ProfileViewController.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var answeredQuestionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let profileLabel = UILabel()
        profileLabel.text = "Profile"
        profileLabel.textColor = .black
        profileLabel.font = UIFont(name: "Anek Devanagari", size: 20)
        profileLabel.textAlignment = .left
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLabel)
        
        let profileImage = UIImageView(image: UIImage(named: "profile"))
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.cornerRadius = 60
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        let nameLabel = UILabel()
        nameLabel.text = "Shawn Howard"
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "SF Pro Text", size: 17)
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        let emailLabel = UILabel()
        emailLabel.text = "shawn_howard@gmail.com"
        emailLabel.textColor = .black
        emailLabel.font = UIFont(name: "SF Pro Text", size: 13)
        emailLabel.textAlignment = .left
        emailLabel.alpha = 0.48
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        
        let informationSection = UIView()
        informationSection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(informationSection)
        
        let informationLabel = UILabel()
        informationLabel.text = "Information"
        informationLabel.textColor = .black
        informationLabel.font = UIFont(name: "Inter", size: 13)
        informationLabel.alpha = 0.4
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationSection.addSubview(informationLabel)
        
        let scoreLabel = UILabel()
        scoreLabel.text = "Score"
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont(name: "Inter", size: 17)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        informationSection.addSubview(scoreLabel)
        
        let scoreCountLabel = UILabel()
        scoreCountLabel.text = "10"
        scoreCountLabel.textColor = .black
        scoreCountLabel.textAlignment = .right
        scoreCountLabel.translatesAutoresizingMaskIntoConstraints = false
        informationSection.addSubview(scoreCountLabel)
        
        let answeredQuestionsLabel = UILabel()
        answeredQuestionsLabel.text = "Answered Questions"
        answeredQuestionsLabel.textColor = .black
        answeredQuestionsLabel.font = UIFont(name: "Inter", size: 17)
        answeredQuestionsLabel.translatesAutoresizingMaskIntoConstraints = false
        informationSection.addSubview(answeredQuestionsLabel)
        
        let scoreSeparatorView = UIView()
        scoreSeparatorView.backgroundColor = .black
        scoreSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        informationSection.addSubview(scoreSeparatorView)
        
        let answeredQuestionsSeparatorView = UIView()
        answeredQuestionsSeparatorView.backgroundColor = .black
        answeredQuestionsSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        informationSection.addSubview(answeredQuestionsSeparatorView)
        
        let logOutButton = UIButton(type: .system)
        logOutButton.setTitle("Log Out", for: .normal)
        logOutButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        logOutButton.backgroundColor = .black
        logOutButton.setTitleColor(.white, for: .normal)
        logOutButton.layer.cornerRadius = 8
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logOutButton)
        
        let logOutIcon = UIImageView(image: UIImage(systemName: "arrow.right.circle.fill"))
        logOutIcon.tintColor = .white
        logOutIcon.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.addSubview(logOutIcon)
        
        let bottomSeparatorView = UIView()
        bottomSeparatorView.backgroundColor = .black
        bottomSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomSeparatorView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapAnsweredQuestions))
        answeredQuestionsLabel.isUserInteractionEnabled = true
        answeredQuestionsLabel.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            profileLabel.widthAnchor.constraint(equalToConstant: 119),
            profileLabel.heightAnchor.constraint(equalToConstant: 18),
            profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 114),
            profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            profileImage.widthAnchor.constraint(equalToConstant: 120),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 156),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 137),
            
            nameLabel.widthAnchor.constraint(equalToConstant: 120),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 309),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            
            emailLabel.widthAnchor.constraint(equalToConstant: 185),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 335),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 106),
            
            informationSection.widthAnchor.constraint(equalToConstant: 381),
            informationSection.heightAnchor.constraint(equalToConstant: 253),
            informationSection.topAnchor.constraint(equalTo: view.topAnchor, constant: 384),
            informationSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            
            informationLabel.widthAnchor.constraint(equalToConstant: 91),
            informationLabel.heightAnchor.constraint(equalToConstant: 18),
            informationLabel.topAnchor.constraint(equalTo: informationSection.topAnchor, constant: 30),
            informationLabel.leadingAnchor.constraint(equalTo: informationSection.leadingAnchor, constant: 12),
            
            scoreLabel.widthAnchor.constraint(equalToConstant: 45),
            scoreLabel.heightAnchor.constraint(equalToConstant: 22),
            scoreLabel.topAnchor.constraint(equalTo: informationSection.topAnchor, constant: 60),
            scoreLabel.leadingAnchor.constraint(equalTo: informationSection.leadingAnchor, constant: 12),
            
            scoreCountLabel.widthAnchor.constraint(equalToConstant: 21),
            scoreCountLabel.heightAnchor.constraint(equalToConstant: 22),
            scoreCountLabel.topAnchor.constraint(equalTo: informationSection.topAnchor, constant: 60),
            scoreCountLabel.trailingAnchor.constraint(equalTo: informationSection.trailingAnchor, constant: -12),
            
            answeredQuestionsLabel.widthAnchor.constraint(equalToConstant: 159),
            answeredQuestionsLabel.heightAnchor.constraint(equalToConstant: 22),
            answeredQuestionsLabel.topAnchor.constraint(equalTo: informationSection.topAnchor, constant: 134),
            answeredQuestionsLabel.leadingAnchor.constraint(equalTo: informationSection.leadingAnchor, constant: 12),
            
            scoreSeparatorView.widthAnchor.constraint(equalToConstant: 365),
            scoreSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            scoreSeparatorView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 12),
            scoreSeparatorView.leadingAnchor.constraint(equalTo: informationSection.leadingAnchor, constant: 12),

            answeredQuestionsSeparatorView.widthAnchor.constraint(equalToConstant: 365),
            answeredQuestionsSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            answeredQuestionsSeparatorView.topAnchor.constraint(equalTo: answeredQuestionsLabel.bottomAnchor, constant: 12),
            answeredQuestionsSeparatorView.leadingAnchor.constraint(equalTo: informationSection.leadingAnchor, constant: 12),
            
            logOutButton.widthAnchor.constraint(equalToConstant: 381),
            logOutButton.heightAnchor.constraint(equalToConstant: 56),
            logOutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logOutIcon.widthAnchor.constraint(equalToConstant: 24),
            logOutIcon.heightAnchor.constraint(equalToConstant: 24),
            logOutIcon.centerYAnchor.constraint(equalTo: logOutButton.centerYAnchor),
            logOutIcon.trailingAnchor.constraint(equalTo: logOutButton.trailingAnchor, constant: -16),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 381),
            bottomSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            bottomSeparatorView.topAnchor.constraint(equalTo: logOutButton.bottomAnchor, constant: 8),
            bottomSeparatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func didTapAnsweredQuestions() {
        let answeredQuestionVC = AnsweredQuestionViewController()
        navigationController?.pushViewController(answeredQuestionVC, animated: true)
    }
}
