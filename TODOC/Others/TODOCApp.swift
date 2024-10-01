//
//  TODOCApp.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import SwiftUI
import FirebaseCore

// Remove @UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct TODOCApp: App {
    // Register AppDelegate to handle Firebase initialization
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView() // Your main view
        }
    }
}
