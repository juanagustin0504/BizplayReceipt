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
    
    @IBOutlet weak var myRcptTableView: UITableView!
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        removeLineNavigationBar()
        
    }
    
    private func removeLineNavigationBar() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default) //UIColor(hexString: "F5F5F5")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.clear//UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
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
    
}

// TableViewDelegate, TableViewDataSource 구현 해야 함. //
extension MyReceiptViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ReceiptListItemCell()
        return cell
    }
    
    
}
