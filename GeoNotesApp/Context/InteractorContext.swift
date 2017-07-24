import Foundation


class InteractorContextBridge {
    static var get: InteractorContextProtcol = InteractorContext()
}

protocol InteractorContextProtcol {
    var userSession: UserSessionProtocol { get }
    var authenticationInteractor: AuthenticationInteractorProtcol { get }
}

class InteractorContext: InteractorContextProtcol {
    var userSession: UserSessionProtocol = UserSession.instance
    var authenticationInteractor: AuthenticationInteractorProtcol { return AuthenticationInteractor() }
}
