//
//  GameViewController.swift
//  metro
//
//  Created by Ksenia on 03.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation
import UIKit

import GameKit

class GameViewController: UIViewController {
    
    private func reloadLabels(){
        labelQuestion.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].title
        labelAnswer1.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].answers[0]
        labelAnswer2.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].answers[1]
        labelAnswer3.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].answers[2]
        labelAnswer4.text = questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].answers[3]
    }
    
    private var questions = [
        Question(
            title: "Сколько стоит тройка?",
            answers: ["50р", "1000р", "2000р", "бесплатно"],
            correctAnswer: 1),
        Question(
            title: "Сколько веток в московском метро?",
            answers: ["10", "17", "12", "7"],
            correctAnswer: 3),
        Question(
            title: "Сколько выходов на китай-городе?",
            answers: ["2", "5", "10", "12"],
            correctAnswer: 4),
        Question(
            title: "На какой ветке расположена станция Беговая?",
            answers: ["желтая", "фиолетовая", "голубая", "кольцевая"],
            correctAnswer: 2),
        Question(
            title: "Какая из этих станций не относится к Кольцевой Линии?",
            answers: ["Проспект Мира", "Пролетарская", "Киевская", "Октябрьская"],
            correctAnswer: 2),
        Question(
            title: "На какой станции самый короткий эскалатор, который поднимает пассажиров всего на 3 метра?",
            answers: ["Саларьево", "Кропоткинская", "Ленинский проспект", "Охотный Ряд"],
            correctAnswer: 1),
        Question(
            title: "В каком году состоялось официальное открытие Московского метро?",
            answers: ["В 1935", "В 1938", "В 1941", "В 1947"],
            correctAnswer: 1),
        Question(
            title: "Единственная станция московского метро, в которой находится фонтан?",
            answers: ["Охотный ряд", "Маяковская", "Римская", "Выставочная"],
            correctAnswer: 3),
        Question(
            title: "На какой ветке находится станция Шаболовская?",
            answers: ["зеленая", "красная", "кольцевая", "рыжая"],
            correctAnswer: 4),
        Question(
            title: "На какой ветке находится станция Петровско-Разумовская?",
            answers: ["серая", "красная", "желтая", "салатовая"],
            correctAnswer: 1)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gameSession = GameSession(numberOfAllQuestions: questions.count)
        Game.shared.gameSession = gameSession

        labelAnswer1.lineBreakMode = .byWordWrapping
        labelAnswer1.numberOfLines = 0
        labelAnswer2.lineBreakMode = .byWordWrapping
        labelAnswer2.numberOfLines = 0
        labelAnswer3.lineBreakMode = .byWordWrapping
        labelAnswer3.numberOfLines = 0
        labelAnswer4.lineBreakMode = .byWordWrapping
        labelAnswer4.numberOfLines = 0
        
        labelQuestion.lineBreakMode = .byWordWrapping
        labelQuestion.numberOfLines = 0
        
        if (Game.shared.strategyQuestions == .random) {
            questions.shuffle()
        }
        reloadLabels()
       }

    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelAnswer1: UILabel!
    @IBOutlet weak var labelAnswer2: UILabel!
    @IBOutlet weak var labelAnswer3: UILabel!
    @IBOutlet weak var labelAnswer4: UILabel!
    
    private func increseScore(_ buttonNumber: Int){
        if (questions[(Game.shared.gameSession?.numberOfCorrectAnswer)!].correctAnswer == buttonNumber && (Game.shared.gameSession!.numberOfCorrectAnswer + 1 != Game.shared.gameSession?.numberOfAllQuestions)) {
            Game.shared.gameSession?.numberOfCorrectAnswer += 1
            reloadLabels()
        }
        else {
            Game.shared.results.append(Result(score: Game.shared.gameSession!.numberOfCorrectAnswer))
            let gameSession = GameSession(numberOfAllQuestions: questions.count)
            Game.shared.gameSession = gameSession
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func clickAnswer1(_ sender: Any) {
        increseScore(1)
    }
    @IBAction func clickAnswer2(_ sender: Any) {
        increseScore(2)
    }
    @IBAction func clickAnswer3(_ sender: Any) {
        increseScore(3)
    }
    @IBAction func clickAnswer4(_ sender: Any) {
        increseScore(4)
    }
    
    
    
    @IBAction func ButtonClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}


extension Array {
    mutating func shuffle () {
        for i in (0..<self.count).reversed() {
            let ix1 = i
            let ix2 = Int(arc4random_uniform(UInt32(i+1)))
            (self[ix1], self[ix2]) = (self[ix2], self[ix1])
        }
    }
}
