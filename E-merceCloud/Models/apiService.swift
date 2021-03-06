//
//  apiService.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 4/2/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class apiServer {
    func signInProcess(_ parameters: [String :  String], success: @escaping (Any?) -> Void){
        
        
        let url : URL = URL(string: "https://mobilerestapi.klauskt.now.sh/sessions/signin")!
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in
            
            success(response.result.value)
        }
    }
    
    func signUpProcess(_ parameters: [String :  String], success: @escaping (Any?) -> Void){
        
        
        let url : URL = URL(string: "https://mobilerestapi.klauskt.now.sh/users/add")!
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in
            
            success(response.result.value)
        }
    }
    
    func getProducts(_ parameters: [String :  String], success: @escaping (Any?) -> Void){
        
        
        let url : URL = URL(string: "https://mobilerestapi.klauskt.now.sh/products")!
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in

            success(response.result.value)
        }
    }
    
    func postCart(_ parameters: [String :  String], success: @escaping (Any?) -> Void){
        
        let url : URL = URL(string: "https://mobilerestapi.klauskt.now.sh/cart/add")!
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in
            
            success(response.result.value)
        }
    }
    
    func getUser(_ parameters: [String :  String], success: @escaping (Any?) -> Void){
        
        
        let url : URL = URL(string: "https://mobilerestapi.klauskt.now.sh/users/find")!
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in
            
            success(response.result.value)
        }
    }
    
    func getCart(_ parameters: [String :  String], success: @escaping (Any?) -> Void){
        
        
        let url : URL = URL(string: "https://mobilerestapi.klauskt.now.sh/cart/find/" + parameters["email"]!)!
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in
            
            success(response.result.value)
        }
    }
    
    func deleteItemCart(_ parameters: [String :  String], success: @escaping (Any?) -> Void){
        
        
        let url : URL = URL(string: "https://mobilerestapi.klauskt.now.sh/cart/delete/" + parameters["id"]!)!
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in
            
            success(response.result.value)
        }
    }
    
}
