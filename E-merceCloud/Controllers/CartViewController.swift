//
//  CartViewController.swift
//  E-merceCloud
//
//  Created by Salva Romero on 3/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit
import SwiftyJSON

class CartViewController: UIViewController {

    @IBOutlet weak var cartTable: UITableView!
    let apiInstance: apiServer = apiServer()
    let emerceDAO: EmerceDAO = EmerceDAO()
    var myCart: [ItemCart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getCart()
        cartTable.delegate = self
        cartTable.dataSource = self
        self.cartTable.rowHeight = 90
        self.title = "My Cart"
    }
    
    func getCart(){
        
        let userSignedIn: UserVO = self.emerceDAO.findLastUser()
        
        let parameters: [String: String] = [
            "email" : userSignedIn.email
        ]
        
        print(userSignedIn.email)
        
        
        apiInstance.getCart(parameters){(result) in
            let resultJSON: JSON = JSON(result!)
            
            print(resultJSON)
            
            for cart in resultJSON {
                let email = cart.1["user_email"].rawString()
                let quantity = cart.1["quantity"].rawString()
                let img = cart.1["image"].rawString()
                let name = cart.1["name"].rawString()
                let price = cart.1["atomic_price"].rawString()
                let id = cart.1["_id"].rawString()
                let desc = cart.1["description"].rawString()
                
                let ItemCartInst = ItemCart(user_email: email!, quantity: quantity!, image: img!, name: name!, price: Float(price!) as! Float, id: id!,description: desc!)
                self.myCart.append(ItemCartInst)
            }
            self.cartTable.reloadData()
        }
 
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item_cart = myCart[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductCell
        
        let productFromCart = Product(image: item_cart.image, name: item_cart.name, price: item_cart.price, id: "", description: "")
        
        cell.setProduct(product: productFromCart)
        
        //cell.layoutSubviews()
        return cell
    }
}
