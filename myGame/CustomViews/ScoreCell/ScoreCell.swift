//
//  ScoreCell.swift
//  myGame
//
//  Created by Arina Postnikova on 20.11.22.
//

import UIKit

class ScoreCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        scoreLabel.text = nil
        dateLabel.text = nil
    }
    
    // MARK: - Public methods
    func setupCells(with score: ScoreModel) {
        scoreLabel.text = "\(score.score)"
        dateLabel.text = score.date
    }
}
