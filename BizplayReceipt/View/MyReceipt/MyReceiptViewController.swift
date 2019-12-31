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
    let condtion = 1
    
    private let receiptViewModel = ReceiptViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        
    }
    
    private func requestData() {
        receiptViewModel.request_SCMS_METC_R006(PAGE_NO: "", PAGE_SZ: "") { (error) in
            
            DispatchQueue.main.async {
                self.myRcptTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

// TableViewDelegate, TableViewDataSource 구현 해야 함. //
extension MyReceiptViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptViewModel.responseData?.REC.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if condtion == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell_1", for: indexPath) as! ReceiptListItemCell
            
            return cell1
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell_2", for: indexPath) as! PhotoSaveCell
            return cell2
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
