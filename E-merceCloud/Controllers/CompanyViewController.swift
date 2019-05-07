//
//  CompanyViewController.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 5/7/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {
    @IBOutlet weak var callBton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.95
        pulse.toValue = 1
        
        callBton.layer.add(pulse, forKey: nil)
    }
    
    @IBAction func callAction(_ sender: UIButton) {
        pulsate()
        guard let number = URL(string: "telprompt://6141780583") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(number)
        }
    }
}
