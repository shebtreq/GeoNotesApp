import Foundation
import UIKit

protocol RouterUtilsProtocol {
    static func addViewControllerToRoot<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String) -> U
}

class RouterUtils: RouterUtilsProtocol {
    
    private static var window: UIWindow? {
        return (UIApplication.shared.delegate?.window)!
    }
    
    static func addViewControllerToRoot<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String) -> U {
        let storyboard = UIStoryboard(name: storyBoard, bundle: Bundle(for: LoginViewController.self))
        let viewController1 = storyboard.instantiateViewController(withIdentifier: identifier)
        print("**")
        dump(viewController1)
        let bla = viewController1 as! LoginViewController
        print(bla)
        print("**")
        print(viewController1 as? U)
        if let viewController = viewController1 as? U {
            window?.rootViewController = viewController
            window?.makeKeyAndVisible()
            return viewController
        } else {
            fatalError()
        }
    }
}
