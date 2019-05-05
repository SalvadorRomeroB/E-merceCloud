//
//  HomeCell.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 5/5/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    func setProduct(product: Product){
        getImage(link: product.image)
        productName.text = product.name
        productPrice.text = "$" + String(product.price)
    }
    
    func getImage(link : String){
        let url = URL(string: link)!
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                return }
            DispatchQueue.main.async() {
                print(data)
                self.productImage.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

}
