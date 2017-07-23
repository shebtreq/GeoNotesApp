import Foundation

protocol ApplicationRouterProtocol {
    static func routeToLogin()
}

class ApplicationRouter: ApplicationRouterProtocol {

    private static var routerUtils: RouterUtilsProtocol.Type {
        return ContextFactory.instance.utilsContext.routerUtils
    }
    
    static func routeToLogin() {
        let viewController: LoginViewController = routerUtils.addViewControllerToRoot(withIdentifier: "LoginViewController", fromStoryBoard: "Main")
        viewController.loginPresenter = LoginPresenter()
    }
}
