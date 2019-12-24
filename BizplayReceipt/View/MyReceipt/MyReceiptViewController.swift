//
//  MyReceiptViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/16.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class MyReceiptViewController: UIViewController {

    @IBOutlet weak var btnRcpt: UIButton!
    @IBOutlet weak var btnAlarm: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        mnChageAlpha()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.changeTitle("나의 영수증")
    }
    
    @IBAction func gotoNotification(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func gotoMore(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    func mnChageAlpha() {
        
        btnRcpt.alpha = 1.0
        btnAlarm.alpha = 0.5
        btnMore.alpha = 0.5
        
    }
    
}

// TableViewDelegate, TableViewDataSource 구현 해야 함. //
