//
//  JRProvider+FlutterMethodCall.swift
//  JRouter
//
//  Created by 焦瑞洁 on 2020/9/8.
//
//import Flutter

// MARK: - Flutter
extension JRProvider {
    func linkFlutter(_ target: Target, targetClass: Any, completion: @escaping JRCompletion, linkPoint: LinkPoint) {
        switch target.jump {
        case .method:
//            guard let flutterMethod = targetClass as? FlutterMethodCall else { return }
//            flutterMethod.handleMethod(completion: completion)
            break
        default:
            break
        }
    }
}

//protocol FlutterMethodProtocol: FlutterMethodCall {
//    func handleMethod(completion: @escaping JRCompletion)
//}
//
//extension FlutterMethodCall: FlutterMethodProtocol {
//    func handleMethod(completion: @escaping JRCompletion) {
//
//    }
//}
