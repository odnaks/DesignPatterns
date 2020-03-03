//
//  GameViewController.swift
//  metro
//
//  Created by Ksenia on 03.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    
    
    func reloadLabels(){
        labelQuestion.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].title
        labelAnswer1.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].answers[0]
        labelAnswer2.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].answers[1]
        labelAnswer3.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].answers[2]
        labelAnswer4.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].answers[3]
    }
    
    let questions = [
        Question(title: "Сколько стоит тройка?", answers: ["50р", "1000р", "2000р", "free"], correctAnswer: 1),
        Question(title: "Сколько веток в московском метро?", answers: ["1", "2", "12", "3"], correctAnswer: 3),
        Question(title: "Кто самая красивая женщина в мире?", answers: ["Лера", "Лера", "Лера", "Лерочка"], correctAnswer: 4)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadLabels()
           // Do any additional setup after loading the view.
       }

    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelAnswer1: UILabel!
    @IBOutlet weak var labelAnswer2: UILabel!
    @IBOutlet weak var labelAnswer3: UILabel!
    @IBOutlet weak var labelAnswer4: UILabel!
    @IBAction func clickAnswer1(_ sender: Any) {
        if (questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].correctAnswer == 1 && (Game.shared.gameSession!.numberOfCorrectAnswer + 1 != Game.shared.gameSession?.numberOfAllQuestions)) {
            Game.shared.gameSession?.numberOfCorrectAnswer += 1
            reloadLabels()
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func clickAnswer2(_ sender: Any) {
        if (questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].correctAnswer == 2 && (Game.shared.gameSession!.numberOfCorrectAnswer + 1 != Game.shared.gameSession?.numberOfAllQuestions)) {
            Game.shared.gameSession?.numberOfCorrectAnswer += 1
            reloadLabels()
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func clickAnswer3(_ sender: Any) {
        if (questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].correctAnswer == 3 &&
            (Game.shared.gameSession!.numberOfCorrectAnswer + 1 != Game.shared.gameSession?.numberOfAllQuestions)) {
            Game.shared.gameSession?.numberOfCorrectAnswer += 1
            reloadLabels()
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func clickAnswer4(_ sender: Any) {
        if (questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].correctAnswer == 4 &&
            (Game.shared.gameSession!.numberOfCorrectAnswer + 1 != Game.shared.gameSession?.numberOfAllQuestions)) {
            Game.shared.gameSession?.numberOfCorrectAnswer += 1
            reloadLabels()
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    @IBAction func ButtonClick(_ sender: Any) {
        
    self.dismiss(animated: true, completion: nil)

    }
    
    

   

}

