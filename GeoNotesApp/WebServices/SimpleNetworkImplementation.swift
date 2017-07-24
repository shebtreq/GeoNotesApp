import Foundation

enum HttpMethod: String {
    case GET
    case PUT
    case POST
    
    var value: String {
        return self.rawValue
    }
}

class SimpleNetworkImplementation {
    
    fileprivate static var defaultHeaders: [(key: String, value: String)] = [(key: String, value: String)]()
    fileprivate static var baseUrl: String = ""
    
    fileprivate class DecoratedURLRequest {
        private(set) var urlRequest: URLRequest
        
        init?(urlString: String,
              httpMethod: HttpMethod,
              httpBody: Data? = nil) {
            guard let url = URL(string: SimpleNetworkImplementation.baseUrl + urlString) else { return nil }
            self.urlRequest = URLRequest(url: url)
            self.urlRequest.httpMethod = httpMethod.value
            SimpleNetworkImplementation.defaultHeaders
                .forEach({self.urlRequest.addValue($0.key, forHTTPHeaderField: $0.value)})
        }
    }
}

extension SimpleNetworkImplementation: NetworkProtocol {
    
    static func set(baseUrl: String) { SimpleNetworkImplementation.baseUrl = baseUrl }
    
    static func add(defaultHeaders: [(key: String, value: String)]) {
        SimpleNetworkImplementation.defaultHeaders
            .append(contentsOf: defaultHeaders)
    }
    
    func get(urlString: String,
             success: @escaping (_ response: [String: Any]) -> Void,
             failure: @escaping (_ error: Error) -> Void) {
        
        guard let decoratedUrlRequest = DecoratedURLRequest(urlString: urlString, httpMethod: .GET) else {
            return failure(NSError(domain: "url malformed", code: 0, userInfo: nil))
        }
        NSURLConnection
            .sendAsynchronousRequest(decoratedUrlRequest.urlRequest,
                              queue: OperationQueue.main,
                              completionHandler: {(response, data, error) in
                                if let data = data {
                                    let jsonResponse = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String : Any]
                                    success(jsonResponse)
                                }
                                if let error = error {
                                    failure(error)
                                }
        })
    }
    
    func put(urlString: String,
             body: [String: Any],
             success: @escaping () -> Void,
             failure: @escaping (_ error: Error) -> Void) {
        let data : Data = NSKeyedArchiver.archivedData(withRootObject: body)
        
        guard let decoratedUrlRequest = DecoratedURLRequest(urlString: urlString, httpMethod: .PUT, httpBody: data) else {
            return failure(NSError(domain: "url malformed", code: 0, userInfo: nil))
        }
        NSURLConnection
            .sendAsynchronousRequest(decoratedUrlRequest.urlRequest,
                                     queue: OperationQueue.main,
                                     completionHandler: {(response, data, error) in
                                        guard let error = error else {
                                            success()
                                            return
                                        }
                                        failure(error)
        })
    }
}
