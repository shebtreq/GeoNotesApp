import Foundation
import UIKit

protocol FlowUtilsProtocol {
    static func addViewControllerWithNavigationToRoot<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String) -> U
    static func pushViewController<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String) -> U
    static func presentViewController<U: UIViewController>(withIdentifier identifier: String, fromStoryBoard storyBoard: String, transition: UIModalTransitionStyle?, completionBlock: (() -> Void)?) -> U
}

class FlowUtils: FlowUtilsProtocol {
    
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
}
