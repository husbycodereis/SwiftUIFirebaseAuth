//
//  AppViewModel.swift
//  SwiftUIFirebaseAuth
//
//  Created by Ali Riza Reisoglu on 6.04.2022.
//

import Foundation
import Firebase

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    //similar to @State it tracks changes of a property inside an Object
    @Published var signedIn = false

    var isSignedIn: Bool {
        return auth.currentUser != nil
    }

    func signIn(email: String, password: String) {
        //weak self prevents memory leak from self? inside dispatchqueue
        auth.signIn(withEmail: email, password: password) { [weak self]
            result, error in
            guard result != nil, error == nil else {
                return
            }
            // it runs this code in the main thread with DispatchQueue
            DispatchQueue.main.async {
                self?.signedIn = true
                //success
            }


        }
    }
    //create user has a closure parameter in the end. double tap enter to arrange the syntax for closures
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
                //success
            }
        }
    }

    func signOut() {
        try? auth.signOut()

        self.signedIn = false
    }

}
