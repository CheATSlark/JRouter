//
//  JDrawerPresentationControllerDelegate.swift
//  23
//
//  Created by 焦瑞洁 on 2020/12/3.
//  Copyright © 2020 ddcx. All rights reserved.
//

import Foundation

public protocol JDrawerPresentationControllerDelegate: AnyObject {
    func drawerMovedTo(position: DraweSnapPoint)
}

public enum DraweSnapPoint {
    case top
    case middle
    case close
}
