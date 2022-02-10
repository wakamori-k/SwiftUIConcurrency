//
//  Model.swift
//  SwiftUIConcurrency
//
//  Created by 若森和昌 on 2022/02/10.
//

import Foundation

final class Model {
    private let urlString = "https://api.github.com/zen"
    
    /// Asynchronous function with completion handler
    /// - Parameter completion: Completion handler with random design philosophy as an argument.
    func fetchDesignPhilosophy(completion: @escaping ((String?) -> ())) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(String(data: data, encoding: .utf8))
        }
        
        task.resume()
    }
    
    /// Asynchronous function with async
    /// - Returns: Random design philosophy
    func fetchDesignPhilosophy() async -> String? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
