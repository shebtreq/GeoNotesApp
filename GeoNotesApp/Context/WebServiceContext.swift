import Foundation

protocol WebServiceContextProtocol {
    static var network: NetworkProtocol { get }
    static var authenticationWebService: AuthenticationWebServiceProtocol.Type { get }
}

class WebServiceContext: WebServiceContextProtocol {
    static var network: NetworkProtocol { return SimpleNetworkImplementation() }
    static var authenticationWebService: AuthenticationWebServiceProtocol.Type { return AuthenticationWebService.self }
}
