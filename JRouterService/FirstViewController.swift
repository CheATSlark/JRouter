//
//  FirstViewController.swift
//  JRouter_Example
//
//  Created by 焦瑞洁 on 2020/9/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    deinit {
        print("release viewcontroller")
    }
    
    var delayOut: ((Bool)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func action(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
