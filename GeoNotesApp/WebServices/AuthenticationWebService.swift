import Foundation

protocol AuthenticationWebServiceProtocol {
    static func login(user: UserModel, success: () -> Void, failure: () -> Void)
}

class AuthenticationWebService: AuthenticationWebServiceProtocol {
    static func login(user: UserModel, success: () -> Void, failure: () -> Void) {
        //ContextFactory.instance.webServiceContext.network.
    }
}

