//
//  ProductsDAO.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 4/25/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import CoreData
import UIKit

class ProductDAO: NSObject {
    //MARK: Properties
    var managedObjectContext: NSManagedObjectContext!
    
    //MARK: Initializers
    override init() {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext as NSManagedObjectContext
    }
    
    //MARK: Functions
    func findAll() -> [Product] {
        let fetchRequest: NSFetchRequest<Product> = Movie.fetchRequest()
        var products: [Product] = []
        
        do {
            movies = try managedObjectContext.fetch(fetchRequest)
        } catch let error as NSError {
            NSLog("Error fetching the movies from databse: %@", error)
        }
        
        return products
    }
    
//    func insertMovie(imdbId: String) {
//        let movie: Movie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: managedObjectContext) as! Movie
//        movie.imdbId = imdbId
//        movie.creationDate = Date()
//        do {
//            try managedObjectContext.save()
//        } catch let error as NSError {
//            NSLog("Error saving the movie in database: %@", error)
//        }
//    }
//
//    func deleteMovie(imdbId: String) {
//        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
//        var movies: [Movie] = []
//
//        do {
//            movies = try managedObjectContext.fetch(fetchRequest)
//
//            for movie in movies{
//                if movie.imdbId == imdbId{
//                    managedObjectContext.delete(movie)
//                    break
//                }
//            }
//            try managedObjectContext.save()
//        } catch let error as NSError {
//            NSLog("Error fetching the movies from databse: %@", error)
//        }
//    }
}



