//
//  ProductsViewController.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 4/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        products = createArray()
        tableView.reloadData()
    }
    
    func createArray() ->[Product]{
        
        var tempProducts : [Product] = []
        
        let url = URL(string: "https://images-na.ssl-images-amazon.com/images/I/61KdlfgIBiL._SL1500_.jpg")!
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            let product = Product(image: UIImage(data: data)!, name: "Test Product", price: 100.00);
            tempProducts.append(product)
        }
        
        return tempProducts
        
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
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
        
        return cell
    }   
}
