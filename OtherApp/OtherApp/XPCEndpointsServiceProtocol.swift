//
//  XPCEndpointsServiceProtocol.swift
//  OtherApp
//
//  Created by Khaos Tian on 1/20/24.
//

import Foundation

@objc
protocol XPCEndpointsServiceProtocol: NSObjectProtocol, OS_xpc_object {

    func registerEndpoint(name: String, endpoint: NSXPCListenerEndpoint)
    func getEndpoint(name: String, completionHandler: @escaping (NSXPCListenerEndpoint?) -> Void)
    func getAllEndpoints(completionHandler: @escaping (NSDictionary) -> Void)
}
