//
//  SettingVIewController.swift
//  metro
//
//  Created by Ksenia on 05.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    override func viewDidLoad() {
        switch Game.shared.strategyQuestions {
            case .norm:
                strategyAnswers.selectedSegmentIndex = 1
            default:
                strategyAnswers.selectedSegmentIndex = 0
        }
        
    }
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var strategyAnswers: UISegmentedControl!
    
    @IBAction func clickStrategy(_ sender: Any) {
        switch strategyAnswers.selectedSegmentIndex {
        case 0:
            Game.shared.strategyQuestions = .random
        default:
            Game.shared.strategyQuestions = .norm
        }
    }
    
}
