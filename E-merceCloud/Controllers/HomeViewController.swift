//
//  HomeViewController.swift
//  E-merceCloud
//
//  Created by Salva Romero on 3/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeViewController: UIViewController {
    @IBOutlet weak var featureTableView: UITableView!
    var products: [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
        featureTableView.delegate = self
        featureTableView.dataSource = self
        self.featureTableView.rowHeight = 110
        // Do any additional setup after loading the view.
    }
    
    
    func getProducts(){
        var productIns = Product(image: "https://images-na.ssl-images-amazon.com/images/I/61-6h8HLgkL._SL1001_.jpg", name: "KKmoon Universal Car Blow Off Valve Dump Valve Diverter Turbo BOV for Volkswagen Audi 1.8T 2.7T", price: 43.19, id: "7",description: "100% brand new. \n Fits for Volkswagen Audi 1.8T 2.7L engines. \n Comes with blanking plug and blanking cap. \n Professional installation is highly recommended.")
        self.products.append(productIns)
        productIns = Product(image: "https://images-na.ssl-images-amazon.com/images/I/71VZ-hhYQRL._SL1500_.jpg", name: "Hex Autoparts 20pcs Wheel Lug Nuts 12x1.5 for Toyota RAV4 Camry Avalon Corolla Lexus Scion", price: 18.55, id: "986",description: "Thread Size 12mm x 1.5 or 12x1.5 or M12x1.5 \n Hex Size:21mm \n Shank Length: 0.60")
        self.products.append(productIns)
        productIns = Product(image: "https://images-na.ssl-images-amazon.com/images/I/61ADH89NkeL._SL1500_.jpg", name: "3mm 5x114.3 Hubcentric Wheel Spacers for Toyota Avalon Camry Supra Scion Tc xB Lexus ES300 ES330 ES350 IS250 IS300 IS350 GS300 GS350 (60.1mm bore)", price: 6.99, id: "1205098",description: "[SCION TOYOTA LEXUS APPLICATIONS] 2011-2016 tC. 1992-2017 Camry. 1991-1995 MR2. All IS250, IS300, IS350, GS350, GS400, GS460. And Many More! See Description for Full List.")
        self.products.append(productIns)
        productIns = Product(image: "https://images-na.ssl-images-amazon.com/images/I/716Q0P-HetL._SL1000_.jpg", name: "Hex Autoparts Air Dryer Replaces R955205", price: 82.59, id: "1238",description: "Brand new with high quality \n System Saver 1200 Style \n Replaces: R955205 \n Features Regeneration Valve to help extend cartridge life")
        self.products.append(productIns)
        productIns = Product(image: "https://images-na.ssl-images-amazon.com/images/I/61nUOYU0HxL._SL1500_.jpg", name: "Turbocharger VF40 for Subaru Outback/Legacy GT 2.5L Gasoline Engine", price: 295.99, id: "01283",description: "Precisely balancing test by SCHENCK \nContructed with High Quality Material; Built for Durability and Strength \nAll necessary hardware and gaskets included for ease of installation \nExact fit replacement for the original turbo. No modifications required \nPerform endurance, thermal and vibration tested prior to Packaging")
        self.products.append(productIns)
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeCell
        
        cell.setProduct(product: product)
        
        //cell.layoutSubviews()
        return cell
    }
}
