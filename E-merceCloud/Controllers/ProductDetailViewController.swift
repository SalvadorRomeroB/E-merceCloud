//
//  ProductDetailViewController.swift
//  E-merceCloud
//
//  Created by Salva Romero on 3/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    
    let apiInstance: apiServer = apiServer()
    let emerceDAO: EmerceDAO = EmerceDAO()
    
    var product : Product = Product(image: "", name: "", price: 0, id: "0", description: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Product Detail"
        if product.name != ""{
            nameLbl.text = product.name
            productPrice.text = "$" + String(product.price)
            productDescription.text = product.description
            let url = URL(string: product.image)
            downloadImage(from: url!)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var addCartBtn: UIButton!
    
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.95
        pulse.toValue = 1
        
        addCartBtn.layer.add(pulse, forKey: nil)
    }
    
    
    @IBAction func addToCartAction(_ sender: UIButton) {
        pulsate()
        print("******** added to cart! ******")
        
        let userSignedIn: UserVO = self.emerceDAO.findLastUser()
        
        let parameters: [String: String] = [
            "user_email" : userSignedIn.email,
            "quantity" : "1",
            "name": product.name,
            "atomic_price": String(product.price),
            "description": product.description,
            "image": product.image
        ]
 
        
        
        apiInstance.postCart(parameters){(result) in
            let resultJSON: JSON = JSON(result!)
            if !resultJSON["msg"].exists() {
                let alert = UIAlertController(title: "Item added to your cart", message: self.product.name, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: "Error", message: resultJSON["msg"].stringValue, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
 
        
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.productImage.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
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
