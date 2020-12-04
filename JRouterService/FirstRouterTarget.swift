//
//  FirstRouterTarget.swift
//  JRouter_Example
//
//  Created by 焦瑞洁 on 2020/9/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

enum FirstRouterTarget {
    case first
    case out
}

extension FirstRouterTarget: JRouterTargetType {
   
    var navigationClass: UINavigationController.Type {
        UINavigationController.self
    }
    
    var jump: JRJump {
        switch self {
        case .first:
            return .sheet
        case .out:
            return .dismiss
        }
    }
    
    var type: JRType {
        .controller
    }
    
    var targetClass: Any {
        switch self {
        case .first:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC_First") as! FirstViewController
            vc.delayOut = { (isSuccss) in
                if isSuccss == true {
                    self.intercept?(true)
                }
            }
            return vc
        case .out:
            return ""
        }
    }
    
    var isIntercept: Bool {
        switch self {
        case .first:
          return  false
        case .out:
          return  true
        }
    }
    
//    var fixedHeight: CGFloat? {
//        return 445
//    }
}
