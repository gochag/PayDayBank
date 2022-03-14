//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

extension String {
    func checkRegEx(with format: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: format, options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil
    }
    
    func firstLetter() -> String {
          return prefix(1).uppercased()
    }
}
