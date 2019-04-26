//
//  Product.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 4/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import Foundation
import UIKit

class Product {
    
    var image : UIImage
    var name: String
    var price: Float
    
    init(image: UIImage, name: String, price: Float){
        self.image = image;
        self.name = name;
        self.price = price;
    }
}
