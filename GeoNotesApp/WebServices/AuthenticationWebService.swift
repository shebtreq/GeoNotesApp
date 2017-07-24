import Foundation

protocol AuthenticationWebServiceProtocol {
    static func login(user: UserModel,
                      success: @escaping () -> Void,
                      failure: @escaping () -> Void)
}

class AuthenticationWebService: AuthenticationWebServiceProtocol {
    static func login(user: UserModel,
                      success: @escaping () -> Void,
                      failure: @escaping () -> Void) {
        WebServiceContextBridge.get.network.put(urlString: "/login?user=" + user.name,
                                               body: user.toJson,
                                               success: success,
                                               failure: { _ in failure() })
    }
}

