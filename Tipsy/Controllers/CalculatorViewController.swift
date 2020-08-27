//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var button: String?
    var totalPerPerson: String?
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
        button = String(sender.currentTitle!)


        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var coefficient = 0.0
        
        if zeroPctButton.isSelected {
            coefficient = 0.0
        } else if tenPctButton.isSelected {
            coefficient = 0.1
        } else {
            coefficient = 0.2
        }
        
        
        totalPerPerson = String((((Double(billTextField.text!)!) / (Double(splitNumberLabel.text!)!)) + ((Double(billTextField.text!)!) * coefficient / (Double(splitNumberLabel.text!)!))))
        
        
        performSegue(withIdentifier: "goToResult", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = totalPerPerson!
            destinationVC.settingsLabelValue = "Split between \(splitNumberLabel.text!) people, with \(button!)"
            
        }
    }
    
}

