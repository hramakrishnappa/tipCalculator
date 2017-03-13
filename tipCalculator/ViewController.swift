//
//  ViewController.swift
//  tipCalculator
//
//  Created by Harsha Ram on 3/13/17.
//  Copyright © 2017 Harsha Ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Getting default tip rate")
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTip")
        print(intValue)
        tipControl.selectedSegmentIndex = intValue
        calcTip()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateLabels()
    }
    
    @IBAction func OnTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        calcTip()
        animateLabels()
    }
    
    func animateLabels() {
        self.tipLabel.alpha = 1
        self.totalLabel.alpha = 1
        UIView.animate(withDuration: 0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.tipLabel.alpha = 0
            self.totalLabel.alpha = 0
        })
        UIView.animate(withDuration: 0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
        })
    }

    func calcTip() {
        let tipPercentages = [0.10, 0.12, 0.20]
        let bill = Double(billText.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", tip + bill)
    }
}

