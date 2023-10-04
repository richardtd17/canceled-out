////
////  UITabBar.swift
////  Canceled Out Project
////
////  Created by Richard Duong on 10/3/23.
////
//
//import Foundation
//import SwiftUI
//
//let tabTags: [String: Int] = [
//    "home": 0,
//    "settings": 1
//    // Add more if needed
//]
//
//class HostingController<Content: View>: UIHostingController<Content> {
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10) // Adjust this value to your needs
//    }
//}
//
//struct CustomTabBarController: UIViewControllerRepresentable {
//    typealias UIViewControllerType = UITabBarController
//    
//    func makeUIViewController(context: Context) -> UITabBarController {
//        let tabBarController = UITabBarController()
//        
//        
//        let settingsVC = HostingController(rootView: SettingsView())
//        settingsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "gear"), tag: 1)
//        
//        
//        tabBarController.viewControllers = [settingsVC]
//        
//        return tabBarController
//    }
//    
//    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
//        // Handle any updates here, if necessary
//    }
//}
//
