import Foundation

protocol InteractorContextProtocol {
    var userSession: UserSessionProtocol { get }
}

class InteractorContext: InteractorContextProtocol {
    var userSession: UserSessionProtocol = UserSession.instance
}

