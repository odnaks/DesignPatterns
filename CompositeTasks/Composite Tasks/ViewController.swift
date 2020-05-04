//
//  ViewController.swift
//  Composite Tasks
//
//  Created by Ksenia on 09.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleNB: UINavigationItem!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBAction func backAction(_ sender: Any) {
        self.taskDir = self.prevTaskDir!.removeLast()
        titleNB.title = taskDir!.name
        tableView.reloadData()
        
        if (self.prevTaskDir!.count == 0) {
            backButton.isEnabled = false
            backButton.tintColor = UIColor.clear
        }
    }
    
    var prevTaskDir: [Task]?
    var taskDir: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let subTask1_1 = Task(name: "Купить кулич")
        let subTask1_2 = Task(name: "Покрасить яйца")
        let subTask1_2_1 = Task(name: "Купить краску")
        let subTask1_2_2 = Task(name: "Купить яйца")
        let subTask1_2_3 = Task(name: "Покрасить яйца")
        let task1 = Task(name: "Отпраздновать пасху")
        let task2 = Task(name: "Погладить носки")
        subTask1_2.tasks = [subTask1_2_1, subTask1_2_2, subTask1_2_3]
        task1.tasks = [subTask1_1, subTask1_2]
        let task = Task(name: "Tasks")
        task.tasks = [task1, task2]
       
        taskDir = task
        prevTaskDir = []
        titleNB.title = taskDir!.name
//        backButton.isEnabled = 0.01
        backButton.isEnabled = false
        backButton.tintColor = UIColor.clear
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "NewTaskSegue",
               let destinationVC = segue.destination as? NewTaskViewController {
                   destinationVC.delegate = self
           }
       }
}








extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskDir!.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = taskDir!.tasks[indexPath.row].name
        cell.detailTextLabel?.text = String(taskDir!.tasks[indexPath.row].tasks.count)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("section: \(indexPath.section)")
//        print("row: \(indexPath.row)")
        self.prevTaskDir!.append(self.taskDir!)
        self.taskDir = self.taskDir!.tasks[indexPath.row]
        titleNB.title = taskDir!.name
        tableView.reloadData()
        backButton.isEnabled = true
        backButton.tintColor = UIColor.blue
    }
}

extension ViewController: SecondVCDelegate {
    func secondVC_BackClicked(data: Task) {
        self.taskDir!.tasks.append(data)
        tableView.reloadData()
    }
}

