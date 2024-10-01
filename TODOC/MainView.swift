//
//  ContentView.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //Signed In
            accountView
        }
        else
        {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView{
            TodoListView(userId: viewModel.currentUserId).tabItem { Label("Home", systemImage: "house") }
            ProfileView().tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}
