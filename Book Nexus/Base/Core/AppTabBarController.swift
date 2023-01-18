//
//  AppTabBarController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit
import SwiftUI

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNavController = UINavigationController(rootViewController: HomeViewController(collectionViewLayout: .init()))
        homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        
        let exploreNavController = UINavigationController(rootViewController: ExploreViewController(collectionViewLayout: .init()))
        exploreNavController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
        
        let libraryNavController = UINavigationController(rootViewController: LibraryViewController(collectionViewLayout: .init()))
        libraryNavController.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "magazine"), selectedImage: nil)
        
        tabBar.tintColor = ColorsManager.textColor
        tabBar.backgroundColor = ColorsManager.backgroudColor
        tabBar.barTintColor = ColorsManager.textColor
//        
        viewControllers = [homeNavController, exploreNavController, libraryNavController]
//
    }
    
}

//struct AppTabBarView: UIViewControllerRepresentable {
//    
//    typealias UIViewControllerType = UIViewController
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        return AppTabBarController()
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//    }
//}
//
//struct AppTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppTabBarView()
//            .ignoresSafeArea()
//    }
//}
