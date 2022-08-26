//
//  MessageCell.swift
//  SummerChat-Swift
//
//  Created by hakkı can şengönül on 26.08.2022.
//

import UIKit

class MessageCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
