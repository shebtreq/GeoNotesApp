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
    func get(url: String, success: @escaping (_ response: [String: Any]) -> Void, failure: @escaping (_ error: NSError) -> Void)
    func put(url: String, body: [String: Any], success: () -> Void, failure: (_ error: NSError) -> Void)
}




