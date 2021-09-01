//
//  JRouter.swift
//  23
//
//  Created by 焦瑞洁 on 2020/7/6.
//  Copyright © 2020 ddcx. All rights reserved.
//

import UIKit
/// Wrapper for JRouterWrapper compatible types. This type provides an extension point for
/// connivence methods in JRouterWrapper.
public struct JRouterWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

/// Represents an object type that is compatible with JRouterWrapper. You can use `JR` property to get a
/// value in the namespace of Kingfisher.
public protocol JRouterCompatible: AnyObject { }

/// Represents a value type that is compatible with JRouterWrapper. You can use `JR` property to get a
/// value in the namespace of JRouterWrapper.
public protocol JRouterCompatibleValue {}

extension JRouterCompatible {
    /// Gets a namespace holder for JRouterWrapper compatible types.
    public var JR: JRouterWrapper<Self> {
        get { return JRouterWrapper(self) }
        set { }
    }
}

extension JRouterCompatibleValue {
    /// Gets a namespace holder for JRouterWrapper compatible types.
    public var JR:JRouterWrapper<Self> {
        get { return JRouterWrapper(self) }
        set { }
    }
}


extension UIApplication: JRouterCompatible { }
extension JRouterWrapper where Base: UIApplication {
    public static var shared: UIApplication? {
        let selector = NSSelectorFromString("sharedApplication")
        guard Base.responds(to: selector) else { return nil }
        return Base.perform(selector).takeUnretainedValue() as? UIApplication
    }
}


