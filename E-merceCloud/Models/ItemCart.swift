//
//  ItemCart.swift
//  E-merceCloud
//
//  Created by Klaus Kientzle on 5/5/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import Foundation

class ItemCart {
    var user_email: String
    var quantity: String
    var image : String
    var name: String
    var price: Float
    var id: String
    var description:String
    
    init(user_email: String, quantity: String, image: String, name: String, price: Float, id: String, description: String){
        self.user_email = user_email;
        self.quantity = quantity;
        self.image = image;
        self.name = name;
        self.price = price;
        self.id = id;
        self.description = description;
    }
}
