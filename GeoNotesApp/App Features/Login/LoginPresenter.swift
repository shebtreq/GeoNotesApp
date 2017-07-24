import Foundation

protocol LoginPresenterProtocol {
    func attempToLogin(withUser name: String?, password: String?)
}

class LoginPresenter: LoginPresenterProtocol {
    func attempToLogin(withUser name: String?, password: String?) {
        if let name = name, let password = password {
            InteractorContext.instance.authenticationInteractor
                .authentication(withName: name,
                                password: password,
                                success: {
                                    RouterContext.instance.loginRouter.routeToMaps()
                                }, failure: {
                                })
        }
    }
}
