//
//  Task.swift
//  Composite Tasks
//
//  Created by Ksenia on 10.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation

class Task {
    var name: String
    var tasks: [Task] = []
    
    init(name: String) {
        self.name = name
    }
    
    func read() {
        print("reading \(name)")
        print("then reading subTasks: ")
        self.tasks.forEach { $0.read() }
    }
}
