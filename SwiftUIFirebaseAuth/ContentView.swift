//
//  ContentView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Ali Riza Reisoglu on 6.04.2022.
//

import SwiftUI
import FirebaseAuth



struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                VStack {
                    Text("You are signed in")
                        .padding()
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("Sign Out").foregroundColor(.blue)
                    }
                }
               


            } else {
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}

