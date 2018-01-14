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
        let imageUrl:URL = URL(string: imageUrlString)!
        //let imageView = UIImageView(frame: CGRect(x:0, y:260, width:self.view.frame.size.width - 40, height:250))
        // Start background thread so that image loading does not make app unresponsive
        DispatchQueue.global(qos: .userInitiated).async {
            
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            
            // imageView.center = self.view.center
            
            // When from background thread, UI needs to be updated on main_queue
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                self.imageView.image = image
                //self.muscleimageView.contentMode = UIViewContentMode.scaleAspectFit
                //self.scrollView.addSubview(imageView)
            }
        }
    }
}
