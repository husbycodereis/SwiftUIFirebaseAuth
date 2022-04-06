//
//  SwiftUIFirebaseAuthApp.swift
//  SwiftUIFirebaseAuth
//
//  Created by Ali Riza Reisoglu on 6.04.2022.
//

import SwiftUI
import Firebase

//open the project in xcworkspace if you can not scope FirebaseApp
@main
struct SwiftUIFirebaseAuthApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()

        return true
    }
}
