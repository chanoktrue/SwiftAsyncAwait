//
//  ContentView.swift
//  SwiftAsyncAwait
//
//  Created by Thongchai Subsaidee on 21/9/21.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject var userVM = UserViewModel()
    
    var body: some View {
        List {
            ForEach(userVM.users, id: \.self) { user in
                Text(user.name)
            }
        }
        .task {
            await userVM.getUser()
        }
        .refreshable {
            await userVM.getUser()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
