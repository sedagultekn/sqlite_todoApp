//
//  ToDoHucre.swift
//  toDoApp
//
//  Created by Seda Gültekin on 7.08.2023.
//

import UIKit

class ToDoHucre: UITableViewCell {

    @IBOutlet weak var toDoTitleLabel: UILabel!
    
    @IBOutlet weak var toDoTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
