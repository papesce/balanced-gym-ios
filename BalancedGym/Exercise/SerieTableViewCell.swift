//
//  SerieTableViewCell.swift
//  BalancedGym
//
//  Created by Pablou on 10/21/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class SerieTableViewCell: UITableViewCell {

    var serie : Serie = Serie(rep:3, weight: 3)
    
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        refresh()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSerie(newSerie: Serie) {
       self.serie = newSerie
       self.refresh()
    }
    
    func refresh() {
        repsTextField.text = String(serie.rep)
        weightTextField.text = String(serie.weight)
    }

}
