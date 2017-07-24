//
//  Network.swift
//  GeoNotesApp
//
//  Created by S Trq on 23/7/17.
//  Copyright © 2017 S Trq. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    static func add(defaultHeaders: [(key: String, value: String)])
    static func set(baseUrl: String)
    func get(urlString: String, success: @escaping (_ response: [String: Any]) -> Void, failure: @escaping (_ error: Error) -> Void)
    func put(urlString: String, body: [String: Any], success: @escaping () -> Void, failure: @escaping (_ error: Error) -> Void)
}




