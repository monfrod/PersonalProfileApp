//
//  bioView.swift
//  PersonalProfileApp
//
//  Created by yunus on 12.02.2025.
//
import UIKit
import SafariServices

class BioView: UIView {
    
    let iconImage = UIImageView()
    let title = UILabel()
    let subtitle = UILabel()
    let shareImage = UIImageView()
    var resizeImage: Bool = false
    let urlString: String?
    weak var vc: UIViewController?
    
    var tapAction: (() -> Void)?
    
    init(icon: UIImage, title: String, subtitle: String, backColor: UIColor, resizeImage: Bool, url: String){
//        self.tapAction = tapAction
        self.urlString = url
        self.resizeImage = resizeImage
        super.init(frame: .zero)
        setupView(icon: icon, title: title, subtitle: subtitle, backColor: backColor)
        setupTapGesture()
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(icon: UIImage, title: String, subtitle: String, backColor: UIColor){
        self.isUserInteractionEnabled = true
        self.backgroundColor = backColor
        
        iconImage.image = icon
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconImage)
        
        self.title.text = title
        self.title.textColor = .white
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.title.font = UIFont(name: "Inter", size: 12)
        self.title.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        self.addSubview(self.title)
        
        self.subtitle.text = subtitle
        self.subtitle.textColor = .white
        self.subtitle.translatesAutoresizingMaskIntoConstraints = false
        self.subtitle.font = UIFont(name: "Inter", size: 10)
        self.subtitle.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        self.addSubview(self.subtitle)
        
        shareImage.image = .share
        shareImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shareImage)
        
        NSLayoutConstraint.activate([
            self.iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.shareImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.shareImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.shareImage.widthAnchor.constraint(equalToConstant: 25),
            self.shareImage.heightAnchor.constraint(equalToConstant: 25),
            self.title.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 2),
            self.title.leadingAnchor.constraint(equalTo: iconImage.leadingAnchor),
            self.subtitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 3),
            self.subtitle.leadingAnchor.constraint(equalTo: self.title.leadingAnchor)
        ])
        if resizeImage {
            NSLayoutConstraint.activate([
                iconImage.heightAnchor.constraint(equalToConstant: 38),
                iconImage.widthAnchor.constraint(equalToConstant: 38)
            ])
        }
    }
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        tapAction?()
        openLink(url: urlString ?? "")
    }
    
    func openLink(url: String){
        if let url = URL(string: url){
            let safariVC = SFSafariViewController(url: url)
            vc!.present(safariVC, animated: true)
        } else {
            print("error")
        }
    }
}
