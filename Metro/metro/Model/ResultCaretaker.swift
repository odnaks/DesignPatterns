//
//  ResultCaretaker.swift
//  metro
//
//  Created by Ksenia on 05.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation

final class ResultCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "results"
    
    func save(results: [Result]) {
        do {
            let data = try self.encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Result] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Result].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
