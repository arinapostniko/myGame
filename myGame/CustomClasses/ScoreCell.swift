//
//  ScoreCell.swift
//  myGame
//
//  Created by Arina Postnikova on 20.11.22.
//

import UIKit

class ScoreCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var scoreLabel: UIView!
    @IBOutlet weak var dateLabel: UIView!
    
    // MARK: - Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
