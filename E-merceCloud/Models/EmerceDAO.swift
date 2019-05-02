//
//  emerceDAO.swift
//  E-merceCloud
//
//  Created by Klaus Kientzle on 5/2/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EmerceDAO: NSObject {
    //MARK: Properties
    var managedObjectContext: NSManagedObjectContext!
    
    //MARK: Initializers
    override init() {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext as NSManagedObjectContext
    }
    
    //MARK: Functions
    func findAll() -> [UserVO] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        var usersTemp: [UserVO] = []
        
        do {
            if let result = try? managedObjectContext.fetch(fetchRequest) {
                for object in result {
                    var user: UserVO = UserVO()
                    user.email = object.email ?? "admin@gmail.com"
                    user.firstname = object.firstname ?? "admin"
                    user.lastname = object.lastname ?? "admin lastname"
                    
                    usersTemp.append(user)
                }
            } else {
                NSLog("Error fetching the movies from databse")
            }
        }
        
        return usersTemp
    }
    
    //MARK: Functions
    func findLastUser() -> UserVO {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        var usersTemp: [UserVO] = []
        
        do {
            if let result = try? managedObjectContext.fetch(fetchRequest) {
                for object in result {
                    var user: UserVO = UserVO()
                    user.email = object.email ?? "placeholder@gmail.com"
                    user.firstname = object.firstname ?? "placeholder"
                    user.lastname = object.lastname ?? "placeholder lastname"
                    
                    usersTemp.append(user)
                }
            } else {
                NSLog("Error fetching the movies from databse")
            }
        }
        
        return usersTemp.last!
    }
    
    //MARK: Functions
    func findUserByEmail(email: String) -> UserVO {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        var userTemp = UserVO()
        if let result = try? managedObjectContext.fetch(fetchRequest) {
            for object in result {
                
                if object.email == email {
                    userTemp.email = object.email ?? "admin@gmail.com"
                    userTemp.firstname = object.firstname ?? "admin"
                    userTemp.lastname = object.lastname ?? "admin lastname"
                }
            }
        }
        
        return userTemp
    }
    
    func insertUser(email: String, firstname: String, lastname: String) {
        let user: User = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedObjectContext) as! User
        user.email = email
        user.firstname = firstname
        user.lastname = lastname
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            NSLog("Error saving the user in database: %@", error)
        }
    }
    
    func deleteUser(email: String) {
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        if let result = try? managedObjectContext.fetch(fetchRequest) {
            for object in result {
                
                if object.email == email {
                    managedObjectContext.delete(object)
                }
            }
        }
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            NSLog("Error deleting the user in database: %@", error)
        }
    }
}
