//
//  TableViewCell.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 1/28/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import UIKit

 class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var tapToReveal: UILabel!
    @IBOutlet weak var spieOrNot: UILabel!
    @IBOutlet weak var lableForPlayerInCell: UILabel!
    @IBOutlet weak var imageForCell: UIImageView!
    
    func riceive(lableText: String) {
    lableForPlayerInCell.text = lableText
     
    }
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
