//
//  SerieTableViewCell.swift
//  BalancedGym
//
//  Created by Pablou on 10/21/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit



class SerieTableViewCell: UITableViewCell,  UITextFieldDelegate  {

    var delegate: SerieChangeProtocol?
    
    var serie : Serie?
    
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.titleLabel.text = self.exercise.name
        //self.navigationItem.title = "demo";
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self.contentView, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.contentView.addGestureRecognizer(tap)
        
        //init toolbar
        self.addAccessoryView()
        
        //init textfields
        //refresh()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let newrep = Int(repsTextField.text!)!
        let number = NumberFormatter().number(from: weightTextField.text!)
        let newweight = ((Float(truncating: number!) * 1000).rounded()) / 1000
        if (self.serie?.rep != newrep || self.serie?.weight != newweight) {
            self.serie?.rep = newrep
            self.serie?.weight = newweight
            RestApiManager.sharedInstance.updateSerie(serie: self.serie!,
                                                      completionHandler: {
                                                        self.delegate?.serieModelChanged()
                                                        
            } );
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addAccessoryView() -> Void {
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.contentView.frame.size.width, height: 30))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(SerieTableViewCell.doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        //setting toolbar as inputAccessoryView
        self.repsTextField.inputAccessoryView = toolbar
        self.weightTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        self.contentView.endEditing(true)
    }
    
    func setSerie(newSerie: Serie) {
       self.serie = newSerie
       self.refresh()
    }
    
    func refresh() {
        if (serie!.isloaded) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.full
            dateFormatter.timeStyle = .short
            //dateFormatter.dateFormat = "MM-dd-yyyy"
            repsTextField.text = String(self.serie!.rep!)
            weightTextField.text = String(format: "%g", self.serie!.weight!)
            self.dateLabel.text = dateFormatter.string(from: self.serie!.createdAt!)
        }
    }

}
