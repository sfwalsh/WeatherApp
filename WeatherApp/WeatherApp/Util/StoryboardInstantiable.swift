
import UIKit

protocol StoryboardInstantiable {
    static var viewControllerIdentifier: String { get }
    static var storyboardIdentifier: String { get }
}

extension StoryboardInstantiable where Self: UIViewController {
    
    
    static func newInstance() -> Self? {
        let storyboard = UIStoryboard(name: storyboardIdentifier,
                                      bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? Self else { return nil }
        
        return viewController
    }
}
