//
//  NewTaskViewController.swift
//  Composite Tasks
//
//  Created by Ksenia on 09.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation
import UIKit

class NewTaskViewController: UIViewController {
    
    weak var delegate: SecondVCDelegate?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBAction func ClickButtonAdd(_ sender: Any) {
        let text = textField.text
        let newTask = Task(name: text!)
        delegate?.secondVC_BackClicked(data: newTask)
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

protocol SecondVCDelegate: class {
    func secondVC_BackClicked(data: Task)
}
