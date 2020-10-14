import UIKit

protocol WireframeInterface: class {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
    
    func showErrorAlert(with message: String?)
    func showErrorAlert(with message: String?, buttonAction: ((UIAlertAction) -> Void)?)
    func showAlert(with title: String?, message: String?)
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction])
}

class BaseWireframe {

    fileprivate unowned var _viewController: UIViewController
    
    //to retain view controller reference upon first access
    fileprivate var _temporaryStoredViewController: UIViewController?
    
    fileprivate var loadingScreen: UIView?

    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }

}

extension BaseWireframe: WireframeInterface {
    func popFromNavigationController(animated: Bool) {
        _ = navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
    func showErrorAlert(with message: String?) {
        showErrorAlert(with: message, buttonAction: nil)
    }
    
    func showErrorAlert(with message: String?, buttonAction: ((UIAlertAction) -> Void)? = nil) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: buttonAction)
        showAlert(with: "Something went wrong", message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: title, message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        if let navVC = navigationController {
            navVC.present(alert, animated: true, completion: nil)
        } else {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}

extension BaseWireframe {
    
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}

extension UIViewController {
    
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
    
}

extension UINavigationController {
    
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }
    
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
    
}
