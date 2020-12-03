//
//  JRProvider+Controller.swift
//  JRouter
//
//  Created by 焦瑞洁 on 2020/9/8.
//

import UIKit
// MARK: - 控制器 controller
extension JRProvider {
    /// 关联控制器类型的处理
    func linkController(_ target: Target, targetClass: Any, completion: @escaping JRCompletion, linkPoint: LinkPoint){
        let from = target.from as? UIViewController
        switch target.jump {
        case .present, .embed_present, .root_present, .dismiss, .sheet:
            
            guard let controller = targetClass as? UIViewController else {
                if target.jump == .dismiss {
                    guard let currentViewController = from ?? UIViewController.topController else { return }
                    currentViewController.dismiss(animated: true, completion: nil)
                }
                return
            }
            presnet(target, from: from, to: controller,jump: target.jump, linkPoint: linkPoint)
        case .push, .pop:
            let controller = targetClass as? UIViewController
            push(from, to: controller, jump: target.jump)
        default:
            break
        }
    }
    
    func presnet(_ target: Target, from: UIViewController?, to: UIViewController,jump: JRJump, linkPoint: LinkPoint) {
        guard let currentViewController = from ?? UIViewController.topController else { return }
        switch jump {
        case .present, .sheet:
            if jump == .sheet {
                to.modalPresentationStyle = .custom
                to.transitioningDelegate = linkPoint
            }else{
                to.modalPresentationStyle = .fullScreen
            }
            currentViewController.present(to, animated: true)
        case .dismiss:
            currentViewController.dismiss(animated: true, completion: nil)
        case .embed_present:
            let vc = target.navigationClass.init(rootViewController: to)
            vc.modalPresentationStyle = .fullScreen
            currentViewController.present(vc, animated: true)
        case .root_present:
            let vc = target.navigationClass.init(rootViewController: to)
            vc.modalPresentationStyle = .fullScreen
            if #available(iOS 13.0, *) {
                   let keyWindow = UIApplication.shared.connectedScenes
                              .map({$0 as? UIWindowScene})
                              .compactMap({$0})
                              .first?.windows.first
                keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
            }else{
                 UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    func push(_ from: UIViewController?, to: UIViewController?, jump: JRJump) {
        
        guard let navigationController = from?.navigationController ?? UIViewController.topController?.navigationController else { return }
        switch jump {
        case .push:
            guard let toVc = to else { return }
            navigationController.pushViewController(toVc, animated: true)
        case .pop:
            guard let toVc = to else {
                navigationController.popViewController(animated: true)
                return
            }
            navigationController.popToViewController(toVc, animated: true)
        default:
            break
        }
    }
    
}
 
private extension UIViewController {
    
    class var sharedApplication: UIApplication? {
        guard let sharedApplication = JRouterWrapper<UIApplication>.shared else { return  nil }
        return sharedApplication
    }
    
    class var topController: UIViewController? {
        guard let currentWidows = self.sharedApplication?.windows else {
            return nil
        }
        var rootVC: UIViewController?
        for window in currentWidows {
            if let windowRootVC = window.rootViewController, window.isKeyWindow {
                rootVC = windowRootVC
                break
            }
        }
        return self.autoGetTopController(of: rootVC)
    }
    
    class func autoGetTopController(of ViewController:UIViewController?) -> UIViewController? {
        if let presentedVC = ViewController?.presentedViewController {
            return self.autoGetTopController(of: presentedVC)
        }
        if let tabBarController = ViewController as? UITabBarController,
            let selectVC = tabBarController.selectedViewController {
            return self.autoGetTopController(of: selectVC)
        }

        if let navigationController = ViewController as? UINavigationController,
            let visibleVC = navigationController.visibleViewController{
            return self.autoGetTopController(of: visibleVC)
        }
        if let pageVC = ViewController as? UIPageViewController,
            pageVC.viewControllers?.count == 1{
            return self.autoGetTopController(of: pageVC.viewControllers?.first)
        }
        return ViewController
    }
}

