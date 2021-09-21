//
//  UserViewModel.swift
//  SwiftAsyncAwait
//
//  Created by Thongchai Subsaidee on 21/9/21.
//

import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var users = [User]()

    func getUser() async {
        self.users = await  UserService().fetchUsers()        
    }
}
