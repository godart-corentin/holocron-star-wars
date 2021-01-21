//
//  ResultTitleTableViewCell.swift
//  Holocron
//
//  Created by Coco on 20/01/2021.
//

import UIKit

class ResultTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelType: UILabel!
    
    var apiData: ApiData?
    
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
    
    func fill(withData data: ApiData) {
        guard let sureDataType = data.type else {
            return
        }
        labelType.text = sureDataType
        guard let sureDataTitle = data.title else {
            labelName.text = data.name?.capitalized ?? ""
            return
        }
        labelName.text = sureDataTitle.capitalized
    }
}
