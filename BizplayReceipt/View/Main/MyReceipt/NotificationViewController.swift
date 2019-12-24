//
//  NotificationViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/24.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var btnRcpt: UIButton!
    @IBOutlet weak var btnAlarm: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mnChageAlpha()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.changeTitle("알림")
    }
    
    @IBAction func gotoRcpt(_ sender: UIButton) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func gotoMore(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    func mnChageAlpha() {
        
        btnRcpt.alpha = 0.5
        btnAlarm.alpha = 1.0
        btnMore.alpha = 0.5
        
    }
    
}
