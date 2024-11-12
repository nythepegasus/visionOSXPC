//
//  TextTransferService.swift
//  XPCExchange
//
//  Created by Khaos Tian on 1/20/24.
//

import Foundation

@objc
protocol TextTransferServiceProtocol {

    func textDidChange(_ text: String)
}

@Observable
class TextTransferService: NSObject, TextTransferServiceProtocol, NSXPCListenerDelegate {

    let listener = NSXPCListener.anonymous()
    var currentText = ""

    override init() {
        super.init()

        listener.delegate = self
        listener.resume()
    }

    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedObject = self
        newConnection.exportedInterface = NSXPCInterface(with: TextTransferServiceProtocol.self)
        newConnection.resume()

        return true
    }

    func textDidChange(_ text: String) {
        NSLog("Text did change: %@", text)
        if text == "Bye!" {
            NSLog("???")
            NotificationManager.shared.scheduleNotification(date: Calendar.current.date(byAdding: .second, value: 2, to: Date()) ?? Date(), title: "App said goodbye!", subtitle: text)
        }
        DispatchQueue.main.async {
            self.currentText = text
        }
    }
}
