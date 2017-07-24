import Foundation

class RouterContext {
    
    static let instance = RouterContext()
    
    private init() {}
    
    var applicationRouter: ApplicationRouterProtocol.Type { return ApplicationRouter.self }
    var loginRouter: LoginRouterProtocol.Type { return LoginRouter.self }
//    var mapsRouter: MapsRouterProtocol { return MapRouter() }
}
