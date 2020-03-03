//
//  Game.swift
//  metro
//
//  Created by Ksenia on 03.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation

class GameSession {
    let numberOfAllQuestions: Int
    var numberOfCorrectAnswer: Int
    
    init(numberOfAllQuestions: Int) {
        self.numberOfAllQuestions = numberOfAllQuestions
        self.numberOfCorrectAnswer = 0
    }
}

class Game {
    static let shared = Game()
    var results = [Int]()
    var gameSession: GameSession?
    
    private init(){}
}
