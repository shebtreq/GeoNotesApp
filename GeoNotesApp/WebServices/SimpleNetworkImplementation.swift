//
//  SimpleNetworkImplementation.swift
//  GeoNotesApp
//
//  Created by S Trq on 23/7/17.
//  Copyright © 2017 S Trq. All rights reserved.
//

import Foundation

class SimpleNetworkImplementation: NetworkProtocol {
    private static var defaultHeaders: [(key: String, value: String)] = [(key: String, value: String)]()
    
    static func add(defaultHeaders: [(key: String, value: String)]) {
        SimpleNetworkImplementation.defaultHeaders.append(contentsOf: defaultHeaders)
    }
    
    private func createRequest() -> NSMutableURLRequest {
        var request : NSMutableURLRequest = NSMutableURLRequest()
        SimpleNetworkImplementation.defaultHeaders.forEach({request.addValue($0.key, forHTTPHeaderField: $0.value)})
        return request
    }
    
    func get(url: String,
             success: @escaping (_ response: [String: Any]) -> Void,
             failure: @escaping (_ error: NSError) -> Void) {
//        guard let url = URL(string: url) else {
//            return failure(NSError(domain: "url malformed", code: 0, userInfo: nil))
//        }
//        var request = self.createRequest()
//        request.url = url
//        request.httpMethod = "GET"
//        
//        NSURLConnection.sendAsynchronousRequest(
//            request,
//            queue: OperationQueue(),
//            completionHandler:{ (
//                response:URLResponse!,
//                data: NSData!,
//                error: NSError!) -> Void in
//                if let error = error {
//                    failure(error)
//                }
//                var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
//                let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
//                if let jsonResult = jsonResult {
//                    success(jsonResult)
//                } else {
//                    failure(error.pointee?)
//                }
//        })
    }
    
    func put(url: String,
             body: [String: Any],
             success: () -> Void,
             failure: (_ error: NSError) -> Void) {
//        let request = self.createRequest()
//        request.URL = NSURL(string: url)
//        request.HTTPMethod = "PUT"
//        request.httpBody = body
//        
//        NSURLConnection.sendAsynchronousRequest(
//            request,
//            queue: NSOperationQueue(),
//            completionHandler:{ (
//                response:NSURLResponse!,
//                data: NSData!,
//                error: NSError!) -> Void in
//                if let error = error {
//                    failure(error)
//                } else {
//                    success()
//                }
//        })
    }
}
