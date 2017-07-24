protocol LoginRouterProtocol {
    static func routeToMaps()
}

class LoginRouter: LoginRouterProtocol {
    static func routeToMaps() {
        let viewController: MapsViewController = UtilsContext.instance.flowUtils
            .pushViewController(
                withIdentifier: "MapsViewController",
                fromStoryBoard: "Main")
    }
}
