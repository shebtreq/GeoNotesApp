import Foundation
import UIKit

protocol ViewUtilsProtocol {
    static func addViewControllerWithNavigationToRoot<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String) -> U
    static func pushViewController<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String) -> U
    static func presentViewController<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String, transition: UIModalTransitionStyle?, completionBlock: (() -> Void)?) -> U
    static func presentAlert(withTitle title: String, message: String?)
}

class ViewUtils: ViewUtilsProtocol {
    
    private static var window: UIWindow? {
        return (UIApplication.shared.delegate?.window)!
    }
    
    static func addViewControllerWithNavigationToRoot<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String) -> U {
        let storyboard = UIStoryboard(name: storyBoard, bundle: Bundle(for: U.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return viewController as! U
    }
    
    static func pushViewController<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String) -> U {
        let storyboard = UIStoryboard(name: storyBoard, bundle: Bundle(for: U.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        window?.visibleViewController?.navigationController?.pushViewController(viewController, animated: true)
        return viewController as! U
    }
    
    static func presentViewController<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String, transition: UIModalTransitionStyle?, completionBlock: (() -> Void)?) -> U {
        let storyboard = UIStoryboard(name: storyBoard, bundle: Bundle(for: U.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        window?.visibleViewController?.present(viewController, animated: true, completion: completionBlock)
        if let transition = transition {
            viewController.modalPresentationStyle = .custom
            viewController.modalTransitionStyle = transition
        }
        return viewController as! U
    }
    
    static func presentAlert(withTitle title: String, message: String?) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        window?.visibleViewController?.present(alertView, animated: true, completion: nil)
    }
}
