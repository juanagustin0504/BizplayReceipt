//
//  MoreViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/24.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var btnRcpt: UIButton!
    @IBOutlet weak var btnAlarm: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.changeTitle("더보기")
    }
    
    @IBAction func gotoRcpt(_ sender: UIButton) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func gotoNotification(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
}
