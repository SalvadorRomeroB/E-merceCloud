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

    @IBOutlet weak var checkOutBtn: UIButton!
    @IBOutlet weak var cartTable: UITableView!
    let apiInstance: apiServer = apiServer()
    let emerceDAO: EmerceDAO = EmerceDAO()
    var myCart: [ItemCart] = []
    var viewFlag: Bool = true
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if viewFlag {
            viewFlag = false
        }
        cartTable.delegate = self
        cartTable.dataSource = self
        self.cartTable.rowHeight = 110
        self.title = "My Cart"
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.95
        pulse.toValue = 1
        
        checkOutBtn.layer.add(pulse, forKey: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !viewFlag {
            print("viewDidAppear : CartViewController")
            myCart = []
            getCart()
        }
        
    }
    @IBAction func checkOutAction(_ sender: UIButton) {
        pulsate()
        let alert = UIAlertController(title: "CheckOut Not Implemented", message: "Demo v1.0.0", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getCart(){
        
        let userSignedIn: UserVO = self.emerceDAO.findLastUser()
        
        let parameters: [String: String] = [
            "email" : userSignedIn.email
        ]
        
        
        apiInstance.getCart(parameters){(result) in
            let resultJSON: JSON = JSON(result!)
            
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
            self.getTotal()
        }
 
    }
    
    func getTotal() {
        var total: Float = 0.0
        print(myCart.count)
        for item in myCart {
            let price = Float(item.price) as! Float
            let quantity = Float(item.quantity) as! Float
            total += (price * quantity)
            print(item.price)
        }
        totalLabel.text = "$" + String(round(total*1000)/1000)
    }
    
    func deleteItemFromCart(cart_id: String) {
        let parameters: [String: String] = [
            "id" : cart_id
        ]
        
        apiInstance.deleteItemCart(parameters){(result) in
            let resultJSON: JSON = JSON(result!)
            if !resultJSON["msg"].exists() {
                //Delete succeed
                print("Item successfuly removed from cart")
            }else{
                //Delete fail
                print("Error removing item from cart")
            }
        }
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cartId = myCart[indexPath.row].id
            myCart.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.deleteItemFromCart(cart_id: cartId)
            self.getTotal()
        }
    }
}
