//
//  myCustomTableViewCell.swift
//  Seccion16
//
//  Created by Daniel Escandell González on 15/06/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit

class myCustomTableViewCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .blue
        //Labels
        mySecondLabel.numberOfLines = 0 //lineas infinitas
        
        //Images
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
