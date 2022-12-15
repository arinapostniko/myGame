//
//  ScoreTableViewController + TableView.swift
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
        let index = indexPath.row
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? ScoreCell,
              index >= 0,
              index < scores.count
        else {
            return UITableViewCell()
        }
        
        cell.setupCells(with: scores[index])
        cell.backgroundColor = index % 2 == 1 ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8978094459, green: 0.9091117978, blue: 0.9089129567, alpha: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        selectedRows.remove(index)
    }
    
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        let index = indexPath.row
        if editingStyle == .delete {
            self.scores.remove(at: index)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
