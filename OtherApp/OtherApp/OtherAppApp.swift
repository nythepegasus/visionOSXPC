//
//  OtherAppApp.swift
//  OtherApp
//
//  Created by Khaos Tian on 1/20/24.
//

import UIKit
import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func applicationWillTerminate(_ application: UIApplication) {
        print("Disconnecting XPC..")
        ContentViewModel.shared.disconnect()
    }
}

@main
struct OtherAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 240, height: 480)
    }
}
