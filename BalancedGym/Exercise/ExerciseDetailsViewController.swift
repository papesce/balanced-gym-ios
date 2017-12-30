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
        let urlSt2 = exercise!.muscleURL;
        if (urlSt2 != "")  {
            self.setMuscleURL(imageUrlString: urlSt2)
        }
        //self.equipment.text = exercise!.equipment
        //self.normalizedWeight.text = String(exercise!.normalizedWeight)
    }
    
    func setGifURL(gifURL : String) {
        //let url = URL (string: string)
        //let requestObj = URLRequest(url: url!)
        //webView.load(requestObj)
         DispatchQueue.global(qos: .userInitiated).async {
            let imageURL = UIImage.gifImageWithURL(gifURL)
            DispatchQueue.main.async {
                self.gifImageView.image = imageURL
                //let imageView3 = UIImageView(image: imageURL)
                //imageView3.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 200.0)
                //self.scrollView.addSubview(imageView3)
            }
        }
        
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
                    self.muscleImageView.image = image
                    //self.muscleimageView.contentMode = UIViewContentMode.scaleAspectFit
                    //self.scrollView.addSubview(imageView)
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
