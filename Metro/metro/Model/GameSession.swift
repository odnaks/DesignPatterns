//
//  GameSession.swift
//  metro
//
//  Created by Ksenia on 05.03.2020.
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
