//
//  XPCExchangeApp.swift
//  XPCExchange
//
//  Created by Khaos Tian on 1/20/24.
//

import SwiftUI

@main
struct XPCExchangeApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    NotificationManager.shared.requestPermission()
                    NotificationManager.shared.resetBadgeNumber()
                }
        }
        .defaultSize(width: 240, height: 480)
    }
}
