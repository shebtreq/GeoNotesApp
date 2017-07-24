import Foundation

class InteractorContext {
    
    static let instance = InteractorContext()
    
    private init() {}
    
    var userSession: UserSessionProtocol = UserSession.instance
}

