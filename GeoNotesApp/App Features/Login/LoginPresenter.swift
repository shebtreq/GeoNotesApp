import Foundation

protocol LoginPresenterProtocol {
    func attempToLogin(withUser name: String?, password: String?)
}

class LoginPresenter: LoginPresenterProtocol {
    func attempToLogin(withUser name: String?, password: String?) {
        if let name = name, let password = password {
            //FIX THIS NEXT
            ContextFactory.instance.webServiceContext.authenticationWebService
                .login(user: UserModel(), success: { 
                    
                }, failure: { 
                    
                })
        }
    }
}
