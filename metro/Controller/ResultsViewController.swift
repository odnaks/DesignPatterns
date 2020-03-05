//
//  ResultsViewController.swift
//  metro
//
//  Created by Ksenia on 03.03.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Game.shared.results.count)
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
}


extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let record = Game.shared.results[indexPath.row]
        
        let date = record.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let todaysDate = dateFormatter.string(from: date)
        cell.textLabel?.text = "\(todaysDate) -  \(record.score)"
        return cell
    }
    
}

