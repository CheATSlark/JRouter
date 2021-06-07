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
            guard let flutterTuple = targetClass as? (Any, Any) else { return }
            guard let flutterMethod = flutterTuple.0 as? FlutterMethodProtocol else { return }
            flutterMethod.handleMethod(result: flutterTuple.1, completion: completion)
        default:
            break
        }
    }
}

public protocol FlutterMethodProtocol {
    func handleMethod(result: Any?, completion: @escaping JRCompletion)
}

extension FlutterMethodProtocol {
    func handleMethod(result: Any?, completion: @escaping JRCompletion) {
        
    }
}
