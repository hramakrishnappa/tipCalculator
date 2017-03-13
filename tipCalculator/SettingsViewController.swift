//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Harsha Ram on 3/13/17.
//  Copyright © 2017 Harsha Ram. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipDefaultSelecter: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTip")
        tipDefaultSelecter.selectedSegmentIndex = intValue
    }
    
    @IBAction func onChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(tipDefaultSelecter.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }
}
