//
//  ViewController.swift
//  E-merceCloud
//
//  Created by Salva Romero on 3/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    let apiInstance: apiServer = apiServer()
    let emerceDAO: EmerceDAO = EmerceDAO()

    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginBtn.layer.cornerRadius = 10
        loginBtn.clipsToBounds = true
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        
        performSegue(withIdentifier: "createAccount", sender: nil)
    }
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.95
        pulse.toValue = 1
        
        loginBtn.layer.add(pulse, forKey: nil)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        pulsate()
        let params : [String : String] = ["email": userTxtField.text!, "password": passTxtField.text!]
        apiInstance.signInProcess(params){(result) in
            let resultJSON: JSON = JSON(result!)
            if !resultJSON["msg"].exists() {
                //LoginSuccesss
                self.emerceDAO.insertUser(email: params["email"]!, firstname: "test", lastname: "for now")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "homeSegue", sender: nil)
                }
            }else{
                //LoginFail
                let alert = UIAlertController(title: "Error", message: resultJSON["msg"].stringValue, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

}

