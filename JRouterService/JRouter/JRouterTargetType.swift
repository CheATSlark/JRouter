//
//  JRouterTargetType.swift
//  23
//
//  Created by 焦瑞洁 on 2020/7/4.
//  Copyright © 2020 ddcx. All rights reserved.
//

import UIKit

/// 跳转、方法枚举
public enum JRJump {
    /// 常规导航控制器 push
    case push
    /// 返回 pop
    case pop
    /// 生成新的导航栏的控制器
    case disinter_push
    /// present 新界面
    case present
    /// 退出当前presnet 的界面
    case dismiss
    /// 推出新的navigationcontroller
    case embed_present
    /// 根视图推出
    case root_present
    
    /// 路由方法，类似 flutter method
    case method
}
/// 关联类型枚举
public enum JRType {
    /// 控制器关系类型
    case controller
    ///
    case bridge
    /// Flutter 关系类型
    case flutter
    /// 未定义
    case undefine
}

public protocol JRouterTargetType {
    /// 导航栏类型
    var navigationClass: UINavigationController.Type { get }
    /// 跳转类型
    var jump: JRJump { get }
    /// 路由类型
    var type: JRType { get }
    /// 路由目标
    var targetClass: Any { get }
    /// 发起地点
    var from: Any? { get }
    
    /// 是否启动拦截
    var isIntercept: Bool { get }
    /// 拦截回调
    var intercept: ((Bool)->Void)? { get set }
}

fileprivate var temporary: ((Bool)->Void)?  = nil

public extension JRouterTargetType {
    var intercept: ((Bool)->Void)? {
        get { temporary }
        set { temporary = newValue }
    }
    // 这个由JRouterTarget 进行承担，不需要每次就展开获取一次。
    var from: Any? {
        nil
    }
    
    var isIntercept: Bool {
        return false
    }
}

public enum JRouterTarget: JRouterTargetType {

    case target(JRouterTargetType,_ from: Any? = nil)
    
    public init(_ target: JRouterTargetType) {
        self = JRouterTarget.target(target)
    }
    
    public var navigationClass: UINavigationController.Type {
        return target.navigationClass
    }
    
    public var jump: JRJump {
       return target.jump
    }
    
    public var type: JRType {
        return target.type
    }
    
   public var targetClass: Any {
        return target.targetClass
    }
    
    /// 这里 from 是  send message 的主体，不用和 再深入的一步解析。
   public var from: Any? {
        switch self {
        case .target(_, let pass):
            return pass
        }
    }
    
    var intercept: ((Bool) -> Void)?{
        return target.intercept
    }
    
   public var isIntercept: Bool {
        return target.isIntercept
    }
    
    public var target: JRouterTargetType {
        switch self {
        case .target(let target, _): return target
        }
    }
}
