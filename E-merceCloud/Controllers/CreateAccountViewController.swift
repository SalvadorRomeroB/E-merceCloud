//
//  LoginViewController.swift
//  E-merceCloud
//
//  Created by Salva Romero on 3/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit
import SwiftyJSON

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let apiInstance: apiServer = apiServer()
    
    @IBOutlet weak var firstnameInput: UITextField!
    @IBOutlet weak var lastnameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var passwordConfirmInput: UITextField!
    @IBOutlet weak var companyIdInput: UITextField!
    
    @IBAction func backToLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        
        if passwordInput.text != passwordConfirmInput.text {
            let alert = UIAlertController(title: "Error", message: "Passwords doesn't match", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let params : [String : String] = ["first_name" : firstnameInput.text!, "last_name" : lastnameInput.text!, "email": emailInput.text!, "password_hash": passwordInput.text!, "company_id" : companyIdInput.text!]
            
            self.apiInstance.signUpProcess(params) { (result) in
                let resultJSON: JSON = JSON(result!)
                let alert = UIAlertController(title: "Account Created", message: resultJSON["user"].stringValue, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default){(action) -> Void in
                    self.performSegue(withIdentifier: "signUpHomeSegue", sender: nil)
                })
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
        
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
