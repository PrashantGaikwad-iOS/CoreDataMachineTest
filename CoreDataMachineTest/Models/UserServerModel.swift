//
//  UserServerModel.swift
//  CoreDataMachineTest
//
//  Created by Prashant Gaikwad on 31/05/21.
//

import Foundation

struct UserServerModel: Codable {
    let first_name: String
    let email: String
    let avatar: String
    
    static let databaseHandler = DatabaseHandler.shared
    
    func store() {
        guard let user = UserServerModel.databaseHandler.add(User.self) else {return}
        user.avatar = avatar
        user.email = email
        user.first_name = first_name
        UserServerModel.databaseHandler.save()
    }
}

struct APIResponse<T: Codable>: Codable {
    let data: T
}
