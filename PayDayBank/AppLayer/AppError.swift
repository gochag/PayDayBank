//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

enum AppError: Error {
    case fileNotFound(String)
    case loadFile(String)
    case parsing(String)
    case unknown
}
