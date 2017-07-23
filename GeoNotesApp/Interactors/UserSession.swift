import Foundation

protocol UserSessionProtocol {
}

class UserSession: UserSessionProtocol {
    static let instance = UserSession()
    
    private init() {}
}
