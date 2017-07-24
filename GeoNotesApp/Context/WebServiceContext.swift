import Foundation

class WebServiceContextBridge {
    static var get: WebServiceContextProtcol = WebServiceContext()
}

protocol WebServiceContextProtcol {
    var network: NetworkProtocol { get }
    var authenticationWebService: AuthenticationWebServiceProtocol.Type { get }
}

class WebServiceContext: WebServiceContextProtcol {
    var network: NetworkProtocol { return SimpleNetworkImplementation() }
    var authenticationWebService: AuthenticationWebServiceProtocol.Type { return AuthenticationWebService.self }
}

