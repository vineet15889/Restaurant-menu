//
//  TopDishesTableViewCell.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 23/03/21.
//

import UIKit

class TopDishesTableViewCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var reduce: UIButton!
    @IBOutlet weak var add: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
