//
//  ExerciseDetailsViewController.swift
//  BalancedGym
//
//  Created by Pablou on 11/11/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit
import WebKit

class ExerciseDetailsViewController: UIViewController {

    //model that holds the series
    var exercise: Exercise?
    @IBOutlet weak var normalizedWeight: UILabel!
    @IBOutlet weak var equipment: UILabel!
    
    @IBOutlet weak var muscleGroupLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var muscleImageView: UIImageView!
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urlSt = exercise!.gifURL;
        if (urlSt != "")  {
            self.setGifURL(gifURL: urlSt)
        }
        let urlSt2 = exercise!.exerciseURL;
        if (urlSt2 != "")  {
            self.setMuscleURL(imageUrlString: urlSt2)
        }
        self.muscleGroupLabel.text = exercise!.muscleGroup
        self.targetLabel.text = exercise!.target!.name
        self.equipment.text = exercise!.equipment
        //self.normalizedWeight.text = String(exercise!.normalizedWeight)
    }
    
    func setGifURL(gifURL : String) {
         DispatchQueue.global(qos: .userInitiated).async {
            let imageURL = UIImage.gifImageWithURL(gifURL)
            DispatchQueue.main.async {
                self.muscleImageView.image = imageURL
            }
        }
        
    }
    
    func setMuscleURL(imageUrlString : String) {
            let imageUrl:URL = URL(string: imageUrlString)!
            DispatchQueue.global(qos: .userInitiated).async {
                
                let imageData:NSData = NSData(contentsOf: imageUrl)!
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    self.gifImageView.image = image
                }
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
