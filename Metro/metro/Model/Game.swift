//
//  Game.swift
//  metro
//
//  Created by Ksenia on 03.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation

class Game {
    static let shared = Game()
    var strategyQuestions: StrategyQuestions = .norm
    
    private let resultsCaretaker = ResultCaretaker()
    var results: [Result] {
        didSet {              
            resultsCaretaker.save(results: self.results)
        }
    }
    var gameSession: GameSession?
    
    private init(){
        self.results = self.resultsCaretaker.retrieveRecords()
    }

}
