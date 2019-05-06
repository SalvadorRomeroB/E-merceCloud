//
//  ProductsViewController.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 4/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let apiInstance: apiServer = apiServer()
    
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 110
        self.title = "Products"
    }
    
    func getProducts(){
        apiInstance.getProducts([:]){(result) in
            let resultJSON: JSON = JSON(result!)
            
            for product in resultJSON {
                let img = product.1["image"].rawString()
                let name = product.1["name"].rawString()
                let price = product.1["atomic_price"].rawString()
                let id = product.1["_id"].rawString()
                let desc = product.1["description"].rawString()
                
                let productIns = Product(image: img!, name: name!, price: Float(price!) as! Float, id: id!,description: desc!)
                self.products.append(productIns)
            }
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetail" {
            if let vc = segue.destination as? ProductDetailViewController {
                let indexPath = self.tableView.indexPathForSelectedRow
                vc.product = self.products[indexPath!.row]
            }
        }
    }
}

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductCell
        
        cell.setProduct(product: product)
        
        //cell.layoutSubviews()
        return cell
    }
}
