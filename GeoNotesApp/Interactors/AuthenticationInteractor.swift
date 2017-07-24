import Foundation


protocol AuthenticationInteractorProtcol {
    func authentication(withName name: String, password: String, success: @escaping () -> Void, failure: @escaping () -> Void)
}

class AuthenticationInteractor: AuthenticationInteractorProtcol {
    func authentication(withName name: String, password: String, success: @escaping () -> Void, failure: @escaping () -> Void) {
        WebServiceContext.instance.authenticationWebService
            .login(user: UserModel(name),
                   success: {
                        InteractorContext.instance.userSession.set(userName: name)
                        success()
                 },failure: failure)
    }
}
