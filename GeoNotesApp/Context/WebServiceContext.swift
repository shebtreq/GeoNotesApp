import Foundation
class WebServiceContext {
    
    static let instance = WebServiceContext()
    
    private init() {}
    
    var network: NetworkProtocol { return SimpleNetworkImplementation() }
    var authenticationWebService: AuthenticationWebServiceProtocol.Type { return AuthenticationWebService.self }
}
