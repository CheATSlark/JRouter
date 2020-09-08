//
//  FirstViewController.swift
//  JRouter_Example
//
//  Created by 焦瑞洁 on 2020/9/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    var delayOut: ((Bool)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @IBAction func dismissController(_ sender: Any) {
        print("dissmiss")
        JRouterService.link(.target(FirstRouterTarget.out, self))
        DispatchQueue.main.asyncAfter(deadline: .now()+4) { [weak self] in
            print("success")
            self?.delayOut?(true)
        }
    }
}
