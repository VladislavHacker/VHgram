//
//  ChatTableViewCell.swift
//  VHgram
//
//  Created by Владислав on 13.04.2022.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastMsg: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var newMsg: UILabel!
    
    static let reuseId = "ChatTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(chat: Dictionary<String, String>) {
        name.text = chat["name"]
        lastMsg.text = chat["last"]
        newMsg.text = chat["new"]
        date.text = chat["date"]
    }
    
    override func layoutSubviews() {
        // Set the width of the cell
        super.layoutSubviews()
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.shadowColor =  UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 4
        self.layer.borderWidth = CGFloat(1)
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
