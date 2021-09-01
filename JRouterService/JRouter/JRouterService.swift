//
//  JRouterService.swift
//  23
//
//  Created by 焦瑞洁 on 2020/7/6.
//  Copyright © 2020 ddcx. All rights reserved.
//

import Foundation

public struct JRouterService {
    
    static let provider = JRProvider<JRouterTarget>()
    // <T>
    public static func link(_ target: JRouterTarget, result: ((Any)-> Void)? = nil){
        provider.link(target) { (resultData) in
            result?(resultData)
        }
    }
    
}
