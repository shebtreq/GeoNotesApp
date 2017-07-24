import Foundation

class RouterContextBridge {
    static var get: RouterContextProtcol.Type = RouterContext.self
}

protocol RouterContextProtcol {
    static var applicationRouter: ApplicationRouterProtocol.Type { get }
    static var loginRouter: LoginRouterProtocol.Type { get }
    static var mapsRouter: MapsRouterProtocol.Type { get }
}

class RouterContext: RouterContextProtcol {
    static var applicationRouter: ApplicationRouterProtocol.Type { return ApplicationRouter.self }
    static var loginRouter: LoginRouterProtocol.Type { return LoginRouter.self }
    static var mapsRouter: MapsRouterProtocol.Type { return MapsRouter.self }
}
