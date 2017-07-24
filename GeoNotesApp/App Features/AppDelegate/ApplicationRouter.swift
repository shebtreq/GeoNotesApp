import Foundation

protocol ApplicationRouterProtocol {
    static func routeToLogin()
}

class ApplicationRouter: ApplicationRouterProtocol {

    private static var flowUtils: FlowUtilsProtocol.Type {
        return UtilsContext.instance.flowUtils
    }
    
    static func routeToLogin() {
        let viewController: LoginViewController = flowUtils.addViewControllerWithNavigationToRoot(withIdentifier: "LoginViewController", fromStoryBoard: "Main")
        viewController.loginPresenter = LoginPresenter()
    }
}
