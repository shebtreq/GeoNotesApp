protocol LoginRouterProtocol {
    static func routeToMaps()
}

class LoginRouter: LoginRouterProtocol {
    static func routeToMaps() {
        let viewController: MapsViewController = UtilsContextBridge.get.flowUtils
            .pushViewController(
                withIdentifier: "MapsViewController",
                fromStoryBoard: "Main")
    }
}
