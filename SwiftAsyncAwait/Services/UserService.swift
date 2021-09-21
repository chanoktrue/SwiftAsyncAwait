//
//  UserService.swift
//  SwiftAsyncAwait
//
//  Created by Thongchai Subsaidee on 21/9/21.
//

import SwiftUI

struct UserService {
    
    
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    func fetchUsers() async -> [User] {
        
        print("Refresh data")
        
        guard let url = url else {return []}
        do {
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {return []}
            let users = try JSONDecoder().decode([User].self, from: data)
            return users
        }catch{
            return []
        }

    }
}
