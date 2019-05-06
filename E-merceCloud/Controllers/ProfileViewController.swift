//
//  ProfileViewController.swift
//  E-merceCloud
//
//  Created by Klaus Kientzle on 5/5/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var logOutBtn: UIButton!
    @IBOutlet weak var fnameLabel: UILabel!
    @IBOutlet weak var lnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let emerceDAO: EmerceDAO = EmerceDAO()
    var user = UserVO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = emerceDAO.findLastUser()
        fnameLabel.text = user.firstname
        lnameLabel.text = user.lastname
        emailLabel.text = user.email
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.95
        pulse.toValue = 1
        
        logOutBtn.layer.add(pulse, forKey: nil)
    }
    
    @IBAction func logOutAction(_ sender: UIButton) {
        pulsate()
        emerceDAO.deleteUser(email: user.email)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
