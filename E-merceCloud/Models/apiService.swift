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
}
