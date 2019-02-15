import UIKit

public class NotPaid {
    public static func configure(dueDate: Date, daysDeadline: Int) {
        let viewDidLoad = #selector(UIViewController.viewDidLoad)
        let notPaidViewDidLoad = NSSelectorFromString("notPaidViewDidLoad")

        if UIViewController.instancesRespond(to: notPaidViewDidLoad) {
            return
        }

        let days = daysBetween(from: Date(), to: dueDate)
        let alpha = clamp(value: CGFloat(days + 1) / CGFloat(daysDeadline), min: 0, max: 1)
        
        let implementation = imp_implementationWithBlock({ viewController in
            viewController.perform(notPaidViewDidLoad)
            
            if viewController.parent == nil {
                viewController.view.alpha = alpha
            }
        } as @convention(block) (UIViewController) -> Void)
        
        class_replaceMethod(UIViewController.self,
                            notPaidViewDidLoad,
                            implementation,
                            method_getTypeEncoding(class_getInstanceMethod(UIViewController.self, viewDidLoad)!))
        
        method_exchangeImplementations(class_getInstanceMethod(UIViewController.self, viewDidLoad)!,
                                       class_getInstanceMethod(UIViewController.self, notPaidViewDidLoad)!)
    }
    
    private init() {
        
    }
    
    private static func daysBetween(from fromDate: Date, to toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: fromDate, to: toDate)
        return components.day!
    }
    
    private static func clamp<T: Comparable>(value: T, min: T, max: T) -> T {
        return Swift.max(min, Swift.min(max, value))
    }
}
