//
//  ViewController.swift
//  JRouterService
//
//  Created by 焦瑞洁 on 2020/9/8.
//  Copyright © 2020 焦瑞洁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func presentFirstController(_ sender: Any) {
        JRouterService.link(.target(FirstRouterTarget.first, self))
    }
   
}

