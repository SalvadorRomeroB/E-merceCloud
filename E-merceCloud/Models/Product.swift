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
    
    var image : String
    var name: String
    var price: Float
    var id: String
    var description:String
    
    init(image: String, name: String, price: Float, id: String, description: String){
        self.image = image;
        self.name = name;
        self.price = price;
        self.id = id;
        self.description = description;
    }
}
