//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class ContentViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = .white
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 1
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        
        self.viewControllers =  self.createTabs()
    }
    
    
    private func createTabs() -> [UIViewController] {
        let dashboardView = DashboardAssembly.assembleModule()
        let transactionView = TransactionAssembly.assembleModule()

        
        let dashboardTabItem = UITabBarItem(title: "Dashboard",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))
        let transactionTabItem = UITabBarItem(title: "Transaction",
                                         image: UIImage(systemName: "tray"),
                                         selectedImage: UIImage(systemName: "tray.fill"))
        
        dashboardView.tabBarItem = dashboardTabItem
        transactionView.tabBarItem = transactionTabItem

        
        let navigation1 = UINavigationController(rootViewController: dashboardView)
        let navigation2 = UINavigationController(rootViewController: transactionView)
        
        return [navigation1, navigation2]
    }
    
}

extension ContentViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}
