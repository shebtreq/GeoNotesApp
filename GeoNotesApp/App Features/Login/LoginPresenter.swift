import Foundation

protocol LoginPresenterProtocol {
    func attempToLogin(withUser name: String?, password: String?)
}

class LoginPresenter: LoginPresenterProtocol {
    func attempToLogin(withUser name: String?, password: String?) {
        if let name = name, let password = password {
            InteractorContextBridge.get.authenticationInteractor
                .authentication(withName: name,
                                password: password,
                                success: {
                                    RouterContextBridge.get.loginRouter.routeToMaps()
                                }, failure: {
                                })
        }
    }
}
