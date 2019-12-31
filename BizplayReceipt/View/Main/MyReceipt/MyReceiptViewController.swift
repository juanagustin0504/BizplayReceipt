//
//  MyReceiptViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/16.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class MyReceiptViewController: UIViewController {
    
    @IBOutlet weak var myRcptTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
