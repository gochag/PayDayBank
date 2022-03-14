//
//  Colors.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

enum Colors {
    static let buttonColor = #colorLiteral(red: 0.2196078431, green: 0.7137254902, blue: 1, alpha: 1)
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
