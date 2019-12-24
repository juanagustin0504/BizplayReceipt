//
//  MyReceiptTabBarController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/24.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class MyReceiptTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension UITabBarController {
    func changeTitle(_ title: String?) {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = title ?? ""
        label.font = .title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.hidesBackButton = true
    }
}
