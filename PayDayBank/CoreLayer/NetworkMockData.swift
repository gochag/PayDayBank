//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

typealias NetworkServiceCompletion<T: Decodable> = (Swift.Result<T, AppError>) -> Void

protocol NetworkService: AnyObject {
    func request(completion: @escaping NetworkServiceCompletion<Data>)
}

final class NetworkMockData: NetworkService {
    
    func request(completion: @escaping NetworkServiceCompletion<Data>) {
        
        guard let file = Bundle.main.url(forResource: "db.json", withExtension: nil) else {            
            completion(.failure(.fileNotFound("Couldn't find file in main bundle.")))
            return
        }
        
        do {
            let data = try Data(contentsOf: file)
            completion(.success(data))
        } catch {
            completion(.failure(.loadFile("Couldn't load file from main bundle:\n\(error)")))
        }
    }
}
