//
//  JRProvider+FlutterMethodCall.swift
//  JRouter
//
//  Created by 焦瑞洁 on 2020/9/8.
//

// MARK: - Flutter
extension JRProvider {
    func linkFlutter(_ target: Target, targetClass: Any, completion: @escaping JRCompletion, linkPoint: LinkPoint) {
        switch target.jump {
        case .method:
            guard let flutterMethod = targetClass as? FlutterMethodProtocol else { return }
            flutterMethod.handleMethod(completion: completion)
            break
        default:
            break
        }
    }
}

protocol FlutterMethodProtocol {
    func handleMethod(completion: @escaping JRCompletion)
}

extension FlutterMethodProtocol {
    func handleMethod(completion: @escaping JRCompletion) {

    }
}
