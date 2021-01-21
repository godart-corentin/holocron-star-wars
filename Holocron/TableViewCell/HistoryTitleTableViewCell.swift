//
//  HistoryTitleTableViewCell.swift
//  Holocron
//
//  Created by Coco on 21/01/2021.
//

import UIKit

class HistoryTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var labelName: UILabel!
    
    var searchWord: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        cellView.backgroundColor = .clear
        cellView.layer.borderWidth = 1
        cellView.layer.borderColor = UIColor.white.cgColor
        cellView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(withData data: String) {
        labelName.text = data
    }
}
