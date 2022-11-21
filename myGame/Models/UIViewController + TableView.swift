//
//  UIViewController + TableView.swift
//  myGame
//
//  Created by Arina Postnikova on 20.11.22.
//

import UIKit

extension ScoreTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ScoreCell else {
            return UITableViewCell()
        }
        
        cell.scoreLabel.text = scores[indexPath.row].score
        cell.dateLabel.text = scores[indexPath.row].date
        
        return cell
    }
}
