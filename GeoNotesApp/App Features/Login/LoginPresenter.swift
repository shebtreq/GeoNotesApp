import Foundation

protocol LoginPresenterProtocol {
    func attempToLogin(withUser name: String?, password: String?)
}

class LoginPresenter: LoginPresenterProtocol {
    func attempToLogin(withUser name: String?, password: String?) {
        if let name = name, let password = password {
            //FIX THIS NEXT
            WebServiceContext.instance.authenticationWebService
                .login(user: UserModel(name), success: {
                    print("success")
                    RouterContext.instance.loginRouter.routeToMaps()
                }, failure: { 
                    print("failed")
                })
        }
    }
}
