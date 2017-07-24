protocol LoginRouterProtocol {
    static func routeToMaps()
}

class LoginRouter: LoginRouterProtocol {
    static func routeToMaps() {
        let viewController: MapsViewController = UtilsContextBridge.get.viewUtils
            .pushViewController(
                withIdentifier: "MapsViewController",
                fromStoryBoard: "Main")
    }
}
