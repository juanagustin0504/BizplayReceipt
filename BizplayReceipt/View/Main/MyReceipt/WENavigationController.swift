//
//  WENavigationController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/24.
//  Copyright © 2019 WebCash. All rights reserved. 66 134 245
//

import UIKit

class WENavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default) //UIColor(hexString: "F5F5F5")
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
        self.navigationBar.barTintColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
        
    }

}
