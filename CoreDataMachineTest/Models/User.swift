//
//  User.swift
//  CoreDataMachineTest
//
//  Created by Prashant Gaikwad on 30/05/21.
//

import CoreData

public class User: NSManagedObject {
    @NSManaged var first_name: String
    @NSManaged var email: String
    @NSManaged var avatar: String
}
