import Foundation


protocol AuthenticationInteractorProtcol {
    func authentication(withName name: String, password: String, success: @escaping () -> Void, failure: @escaping () -> Void)
}

class AuthenticationInteractor: AuthenticationInteractorProtcol {
    func authentication(withName name: String, password: String, success: @escaping () -> Void, failure: @escaping () -> Void) {
        WebServiceContextBridge.get.authenticationWebService
            .login(user: UserModel(name),
                   success: {
                        InteractorContextBridge.get.userSession.set(userName: name)
                        success()
                 },failure: failure)
    }
}
