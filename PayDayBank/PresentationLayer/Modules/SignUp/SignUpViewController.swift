//
//  SignOutViewController.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

protocol SignOutViewIntput: AnyObject {
    
}


class SignOutViewController: ViewController {

    var presenter: SignOutViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SignOutViewController: SignOutViewIntput {
    
}
