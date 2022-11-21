//
//  ScoreTableViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 20.11.22.
//

import UIKit

class ScoreTableViewController: UIViewController {
    
    // MARK: - Public properties
    let cellIdentifier = "ScoreCell"
    lazy var scores = Storage.shared.scores

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Private methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
    }
}
