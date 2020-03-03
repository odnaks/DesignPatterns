//
//  MenuViewController.swift
//  metro
//
//  Created by Ksenia on 03.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var ButtonStart: UILabel!
    @IBOutlet weak var ButtonResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameSession = GameSession(numberOfAllQuestions: 11)
        Game.shared.gameSession = gameSession
        
        // Do any additional setup after loading the view.
    }


}


