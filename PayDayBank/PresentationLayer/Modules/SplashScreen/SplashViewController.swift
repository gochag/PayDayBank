//
//  SplashViewController.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

protocol SplashViewIntput: AnyObject {
    
}

final class SplashViewController: UIViewController {
    
    var presenter: SplashViewOutput?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        self.drawSelf()
    }

    
    // MARK: Draw self
    
    private func drawSelf() {
        self.view.backgroundColor = .blue
    }
}


// MARK: - SplashViewIntput

extension SplashViewController: SplashViewIntput {
    
}
