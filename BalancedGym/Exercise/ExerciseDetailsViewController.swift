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
    @IBOutlet weak var multiplier: UILabel!
    @IBOutlet weak var equipment: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urlSt = exercise!.gifURL;
        if (urlSt != "")  {
            self.setGifURL(gifURL: urlSt)
        }
        self.multiplier.text = String(exercise!.multiplier)
        self.equipment.text = exercise!.equipment
        self.normalizedWeight.text = String(exercise!.normalizedWeight)
    }
    
    func setGifURL(gifURL : String) {
        //let url = URL (string: string)
        //let requestObj = URLRequest(url: url!)
        //webView.load(requestObj)
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 200.0)
        view.addSubview(imageView3)
        
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
