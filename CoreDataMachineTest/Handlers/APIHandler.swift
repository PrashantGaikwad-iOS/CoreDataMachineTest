//
//  APIHandler.swift
//  CoreDataMachineTest
//
//  Created by Prashant Gaikwad on 31/05/21.
//

import Foundation

class APIHandler {
    static let shared = APIHandler()
    
    private init() {}
    
    func fetchUsers(completion: @escaping () -> Void) {
        var request = URLRequest(url: URL(string: "https://reqres.in/api/users")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            do {
                if let data = data {                    
                    let model = try JSONDecoder().decode(APIResponse<[UserServerModel]>.self, from: data)
                    model.data.forEach { $0.store() }
                    completion()
                }
            }catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
