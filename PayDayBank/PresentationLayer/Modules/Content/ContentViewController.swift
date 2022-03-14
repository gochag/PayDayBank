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
        
        
        
        
        
        
        let controller = SignInAssembly.assembleModule()
        let tabOneBarItem = UITabBarItem(title: "Dashboard",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))
        controller.tabBarItem = tabOneBarItem
        
        let controller1 = SignUpAssembly.assembleModule()
        let tabTwoBarItem = UITabBarItem(title: "Transaction",
                                         image: UIImage(systemName: "tray"),
                                         selectedImage: UIImage(systemName: "tray.fill"))
        controller1.tabBarItem = tabTwoBarItem
        self.viewControllers = [controller, controller1]
    }
    
}

extension ContentViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}
