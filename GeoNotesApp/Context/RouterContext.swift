import Foundation

protocol RouterContextProtocol {
    static var applicationRouter: ApplicationRouterProtocol.Type { get }
    var loginRouter: LoginRouterProtocol.Type { get }
//    var mapsRouter: MapsRouterProtocol { get }
    
}

class RouterContext: RouterContextProtocol {
    static var applicationRouter: ApplicationRouterProtocol.Type { return ApplicationRouter.self }
    var loginRouter: LoginRouterProtocol.Type { return LoginRouter.self }
//    var mapsRouter: MapsRouterProtocol { return MapRouter() }
}
