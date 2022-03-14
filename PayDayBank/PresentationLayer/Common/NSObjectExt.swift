//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

extension NSObject {
    
    static var className: String {
        return String(describing: self)
    }
    var className: String {
        return String(describing: type(of: self))
    }
    
}
