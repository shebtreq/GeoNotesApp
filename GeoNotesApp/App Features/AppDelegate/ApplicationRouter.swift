import Foundation

protocol ApplicationRouterProtocol {
    static func routeToLogin()
}

class ApplicationRouter: ApplicationRouterProtocol {

    private static var viewUtils: ViewUtilsProtocol.Type {
        return UtilsContextBridge.get.viewUtils
    }
    
    static func routeToLogin() {
        let viewController: LoginViewController = viewUtils.addViewControllerWithNavigationToRoot(withIdentifier: "LoginViewController", fromStoryBoard: "Main")
        viewController.loginPresenter = LoginPresenter()
    }
}
