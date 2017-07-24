import Foundation


protocol JsonMappable {
    init?(json: [String: Any])
    var toJson: [String: Any] { get }
}

extension JsonMappable {
    func convert<U>(key: String, from json: [String: Any]) -> U {
        
        if U.self == String.self, let value = json[key] as? String {
            return value as! U
        }
        
        if U.self == Int.self, let value = json[key] as? Int {
            return value as! U
        }
        
        if let J = U.self as? JsonMappable.Type, let value = json[key] as? [String : Any] {
            return J.init(json: value) as! U
        }
        
        fatalError()
    }
    
    func convert<U>(key: String, from json: [String: Any]) -> [U] {
        
        if let J = U.self as? JsonMappable.Type, let array = json[key] as? [Any] {
            return array.map({ (value: Any) -> U in
                J.init(json: value as! [String : Any]) as! U
            })
        }
        fatalError()
    }
    
    func convert<U>(value: U?, in json: inout [String: Any], with key: String) {
        guard let value = value else { return }
        
        if (value is String || value is Int), let value = json[key] as? String {
            json[key] = value as Any
        }
        
        if let jsonValue = value as? JsonMappable {
            json[key] = jsonValue.toJson
        }
        
        fatalError()
    }
    
    func convert<U>() -> [U] {
        return []
    }
}









