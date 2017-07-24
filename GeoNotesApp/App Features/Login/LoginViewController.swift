import UIKit



class LoginViewController: UIViewController {
    
    var loginPresenter: LoginPresenterProtocol!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func didPressSignInButton(_ sender: UIButton) {
        loginPresenter.attempToLogin(withUser: nameTextField.text, password: passwordTextField.text)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

