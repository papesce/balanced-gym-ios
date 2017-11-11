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
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urlSt = exercise!.gifURL;
        if (urlSt != "")  {
            self.setGifURL(string: urlSt)
        }
    }
    
    func setGifURL(string : String) {
        let url = URL (string: string)
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
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
