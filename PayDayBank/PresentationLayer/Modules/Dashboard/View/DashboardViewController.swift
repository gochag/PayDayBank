//
//  WelcomViewController.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

protocol DashboardViewIntput: AnyObject {
    
}

final class DashboardViewController: ViewController {

    var presenter: DashboardViewOutput?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawSelf()
    }

    private func drawSelf() {
        self.view.backgroundColor = .red
    }
}


//MARK: - WelcomViewIntput

extension DashboardViewController: DashboardViewIntput {
    
}
