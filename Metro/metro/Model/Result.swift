//
//  Result.swift
//  metro
//
//  Created by Ksenia on 05.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation

class Result: Codable {
    let date = Date()
    let score: Int
    init(score: Int) {
        self.score = score
    }
}

