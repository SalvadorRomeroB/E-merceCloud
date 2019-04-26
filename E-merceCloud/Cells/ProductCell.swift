//
//  ProductCell.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 4/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    func setProduct(product: Product){
        productImage.image = product.image
        productName.text = product.name
        productPrice.text = String(product.price)
    }
}
