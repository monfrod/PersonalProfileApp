//
//  HobbiesViewController.swift
//  PersonalProfileApp
//
//  Created by yunus on 07.02.2025.
//
import UIKit
import SwiftUI

class ProjectViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swiftUI = ContentView()
        let hostingController = UIHostingController(rootView: swiftUI)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
        
    }
}
