//
//  MuscleCollectionViewCell.swift
//  BalancedGym
//
//  Created by Pablo Pesce on 13/01/2018.
//  Copyright © 2018 Pablou. All rights reserved.
//

import UIKit

class MuscleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!;
    @IBOutlet weak var muscleLabel: UILabel!
    
    var muscle: Muscle?
    
    func setMuscle(muscle: Muscle) {
        self.muscle = muscle
        setMuscleURL(imageUrlString: muscle.muscleURL)
        muscleLabel.text = muscle.name
    }
    
    
    func setMuscleURL(imageUrlString : String) {
        if (imageUrlString != "") {
            let imageUrl:URL = URL(string: imageUrlString)!
            // Start background thread so that image loading does not make app unresponsive
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData:NSData = NSData(contentsOf: imageUrl)!
                // When from background thread, UI needs to be updated on main_queue
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    self.imageView.image = image
                }
            }
        }
    }
}
