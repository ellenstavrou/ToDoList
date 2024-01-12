//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ellen Stavrou on 26/09/2023.
//
import FirebaseAuth
import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
             if let user = viewModel.user {
                 Spacer()
                 
                 Image(systemName: "person.circle")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 125, height: 125)
                 .foregroundColor(.blue)
                 
                 Spacer()
                 
                 VStack(alignment: .leading) {
                 
                 HStack {
                 Text("Name: ")
                 .bold()
                 Text(user.name)
                 }
                 
                 HStack {
                 Text("Email: ")
                 .bold()
                 Text(user.email)
                 }
                 
                 HStack {
                 Text("Member Since: ")
                 .bold()
                 Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time: .shortened))")
                 }
                 }
                 
                 Spacer()
                 Spacer()
                 Spacer()
                 
                 Button("Log Out") {
                     
                     
                     do {
                         try Auth.auth().signOut()
                     } catch {
                         print(error)
                     }
                     
                 }
                 
             } else {
             Text("Loading profile...")
             }
             }
             .navigationTitle("Profile")
             }
        .onAppear {
            viewModel.fetchUser()
        }
            
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
