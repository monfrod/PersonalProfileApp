//
//  ViewController.swift
//  PersonalProfileApp
//
//  Created by yunus on 07.02.2025.
//

import UIKit
import SwiftUI
import SafariServices

class ProfileViewController: UIViewController {
    
    let widthScaleFactor = UIScreen.main.bounds.width / 393
    let heightScaleFactor = UIScreen.main.bounds.height / 852
    
    let profileImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "profileImage")
        return view
    }()
    
    let infoBar = UIImageView()
    let gradient = GradientView()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    let nameSurnameLabel = UILabel()
    let tgLabel = UILabel()
    
    let VStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 7
        return view
    }()
    
    let HStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 15
        return view
    }()
    let emailView = BioView(icon: UIImage(named: "emailIcon")!, title: "Email", subtitle: "iunus.lalazov.01@gmail.com", backColor: .color1, resizeImage: false, url: "https://mail.google.com/mail/?view=cm&to=example@gmail.com&su=Hello&body=This%20is%20a%20test")
    let facebookView = BioView(icon: UIImage(named: "facebookIcon")!, title: "Facebook", subtitle: "Юнус Лалазов", backColor: .facebook, resizeImage: false, url: "https://m.facebook.com/profile.php?id=100044670811839")
    let githubView = BioView(icon: UIImage(named: "gitIcon")!, title: "GitHub", subtitle: "monfrod", backColor: .git, resizeImage: false, url: "https://github.com/monfrod")
    let instagramView = BioView(icon: UIImage(named: "instagramIcon")!, title: "Instagram", subtitle: "@yunuslalazov", backColor: .instagram, resizeImage: false, url: "https://www.instagram.com/yunuslalazov/")
    let linkedinView = BioView(icon: UIImage(named: "linkedinIcon")!, title: "Linkedin", subtitle: "Yunus Lalazov", backColor: .linkedin, resizeImage: true, url: "https://www.linkedin.com/in/yunus-lalazov/")
    let tgView = BioView(icon: UIImage(named: "tgIcon")!, title: "Telegram", subtitle: "@Yunus0501", backColor: .tg, resizeImage: true, url: "https://t.me/Yunus0501")
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gradient.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(gradient)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        infoBar.image = UIImage(named: "infoBar")
        infoBar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoBar)
        
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 40
        profileImage.contentMode = .scaleToFill
        contentView.addSubview(profileImage)
        
        nameSurnameLabel.text = "Lalazov Yunus"
        nameSurnameLabel.textColor = .white
        nameSurnameLabel.font = UIFont(name: "Futura", size: 24)
        nameSurnameLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        nameSurnameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameSurnameLabel)
        
        tgLabel.text = "tg: @Yunus0501"
        tgLabel.translatesAutoresizingMaskIntoConstraints = false
        tgLabel.font = UIFont(name: "Inter", size: 14)
        tgLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        tgLabel.textColor = .lightGray
        contentView.addSubview(tgLabel)
        
        createLabel(text: "🎈 07.01.2005")
        createLabel(text: "📍 iOS-Developer")
        createLabel(text: "👨‍💻 Dev by me ")
        VStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(VStack)
        
        HStack.translatesAutoresizingMaskIntoConstraints = false
        createLabel(text: "")
        
        emailView.vc = self
        addView(view: emailView)
        facebookView.vc = self
        addView(view: facebookView)
        githubView.vc = self
        addView(view: githubView)
        instagramView.vc = self
        addView(view: instagramView)
        linkedinView.vc = self
        addView(view: linkedinView)
        tgView.vc = self
        addView(view: tgView)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            infoBar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            infoBar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 192),
            infoBar.widthAnchor.constraint(equalToConstant: 353 * widthScaleFactor),
            infoBar.heightAnchor.constraint(equalToConstant: 368 * heightScaleFactor),
            profileImage.widthAnchor.constraint(equalToConstant: 200 * widthScaleFactor),
            profileImage.centerXAnchor.constraint(equalTo: infoBar.centerXAnchor),
            profileImage.bottomAnchor.constraint(equalTo: infoBar.topAnchor, constant: 100 * heightScaleFactor),
            profileImage.heightAnchor.constraint(equalToConstant: 200 * heightScaleFactor),
            nameSurnameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameSurnameLabel.topAnchor.constraint(equalTo: infoBar.topAnchor, constant: 138 * heightScaleFactor),
            gradient.topAnchor.constraint(equalTo: view.topAnchor),
            gradient.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradient.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradient.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tgLabel.centerXAnchor.constraint(equalTo: nameSurnameLabel.centerXAnchor),
            tgLabel.topAnchor.constraint(equalTo: nameSurnameLabel.bottomAnchor, constant: 10),
            VStack.topAnchor.constraint(equalTo: tgLabel.bottomAnchor, constant: 20),
            VStack.leadingAnchor.constraint(equalTo: nameSurnameLabel.leadingAnchor),
            emailView.topAnchor.constraint(equalTo: infoBar.bottomAnchor, constant: 10),
            emailView.leadingAnchor.constraint(equalTo: infoBar.leadingAnchor),
            emailView.widthAnchor.constraint(equalToConstant: 196 * widthScaleFactor),
            emailView.heightAnchor.constraint(equalToConstant: 96 * heightScaleFactor),
            facebookView.topAnchor.constraint(equalTo: infoBar.bottomAnchor, constant: 10),
            facebookView.leadingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 10),
            facebookView.trailingAnchor.constraint(equalTo: infoBar.trailingAnchor),
            facebookView.heightAnchor.constraint(equalToConstant: 96 * heightScaleFactor),
            githubView.leadingAnchor.constraint(equalTo: infoBar.leadingAnchor),
            githubView.trailingAnchor.constraint(equalTo: infoBar.trailingAnchor),
            githubView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 10),
            githubView.heightAnchor.constraint(equalToConstant: 96 * heightScaleFactor),
            linkedinView.trailingAnchor.constraint(equalTo: infoBar.trailingAnchor),
            linkedinView.widthAnchor.constraint(equalToConstant: 196 * widthScaleFactor),
            linkedinView.topAnchor.constraint(equalTo: githubView.bottomAnchor, constant: 10),
            linkedinView.heightAnchor.constraint(equalToConstant: 96 * heightScaleFactor),
            tgView.trailingAnchor.constraint(equalTo: linkedinView.leadingAnchor, constant: -10),
            tgView.leadingAnchor.constraint(equalTo: infoBar.leadingAnchor),
            tgView.topAnchor.constraint(equalTo: githubView.bottomAnchor, constant: 10),
            tgView.heightAnchor.constraint(equalToConstant: 96 * heightScaleFactor),
            instagramView.leadingAnchor.constraint(equalTo: infoBar.leadingAnchor),
            instagramView.trailingAnchor.constraint(equalTo: infoBar.trailingAnchor),
            instagramView.topAnchor.constraint(equalTo: tgView.bottomAnchor, constant: 10),
            instagramView.heightAnchor.constraint(equalToConstant: 96 * heightScaleFactor),
            contentView.bottomAnchor.constraint(equalTo: instagramView.bottomAnchor, constant: 10)
        ])
        
        
    }
    
    func createLabel(text: String){
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Inter", size: 12)
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        VStack.addArrangedSubview(label)
    }
    
    func addView(view: UIView){
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        contentView.addSubview(view)
    }
    
    func openLink(url: String){
        if let url = URL(string: url){
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
        } else {
            print("error")
        }
    }


}

//#Preview(body: {
//    ProfileViewController()
//})

