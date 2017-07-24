import Foundation

protocol UserSessionProtocol {
    func set(userName: String)
}

class UserSession: UserSessionProtocol {
    static let instance = UserSession()
    
    private init() {}
    
    private var userName: String?
    
    func set(userName: String) {
        self.userName = userName
    }
}
