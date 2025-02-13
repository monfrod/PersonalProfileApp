//
//  TabBarController.swift
//  PersonalProfileApp
//
//  Created by yunus on 07.02.2025.
//
import UIKit

class TabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.tabBar.barTintColor = .lightGray
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = .black
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        self.tabBar.standardAppearance = appearance
    }
    private func setupTabs(){
        let profileVC = createNav(title: "Profile", image: UIImage(systemName: "person"), vc: ProfileViewController(), selImage: UIImage(systemName: "person.fill"))
        let hobbiesVC = createNav(title: "My hobbies", image: UIImage(systemName: "dumbbell"), vc: HobbiesViewController(), selImage: UIImage(systemName: "dumbbell.fill"))
        let dreamsVC = createNav(title: "My dreams", image: UIImage(systemName: "trophy"), vc: DreamsViewController(), selImage: UIImage(systemName: "trophy.fill"))
        self.setViewControllers([profileVC, hobbiesVC, dreamsVC], animated: true)
    }
    private func createNav(title: String, image: UIImage?, vc: UIViewController, selImage: UIImage?)-> UIViewController{
        
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selImage
        
        vc.title = title
        
        return vc
    }
}
