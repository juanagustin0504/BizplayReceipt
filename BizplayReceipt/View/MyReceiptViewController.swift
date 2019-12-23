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
    
    @IBOutlet weak var receiptTableView: UITableView!
    
    static var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "나의 영수증"
        label.font = .title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.hidesBackButton = true
        
        mnChageAlpha()
        
    }
    
    @IBAction func onRcpt(_ sender: UIButton) {
        MyReceiptViewController.pageIndex = 0
        mnChageAlpha()
    }
    
    @IBAction func onAlarm(_ sender: UIButton) {
        MyReceiptViewController.pageIndex = 1
        mnChageAlpha()
    }
    
    @IBAction func onMore(_ sender: UIButton) {
        MyReceiptViewController.pageIndex = 2
        mnChageAlpha()
    }
    
    func mnChageAlpha() {
        let index = MyReceiptViewController.pageIndex
        if index == 0 {
            btnRcpt.alpha = 1.0
            btnAlarm.alpha = 0.5
            btnMore.alpha = 0.5
        } else if index == 1 {
            btnRcpt.alpha = 0.5
            btnAlarm.alpha = 1.0
            btnMore.alpha = 0.5
        } else if index == 2 {
            btnRcpt.alpha = 0.5
            btnAlarm.alpha = 0.5
            btnMore.alpha = 1.0
        }
    }
    
}

extension MyReceiptViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
