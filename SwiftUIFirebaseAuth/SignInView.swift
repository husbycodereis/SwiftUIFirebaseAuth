//
//  SignInView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Ali Riza Reisoglu on 6.04.2022.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""

    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            Image("logo").resizable().scaledToFit().frame(width: 150, height: 150)
            VStack {
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(
                        .secondarySystemBackground))
                // $ sign binds the state object to change its value
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(
                        .secondarySystemBackground))
                Button(action: {
                    //guard is similar to assert
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signIn(email: email, password: password)
                }, label: {
                        Text("Sign In").frame(width: 200, height: 50).foregroundColor(.white).background(.blue).cornerRadius(8).padding()
                    })
                NavigationLink("Create Account", destination: SignUpView()).padding()
            }
                .padding()
            Spacer()
        }.navigationTitle("Sign In")
    }
}


//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
