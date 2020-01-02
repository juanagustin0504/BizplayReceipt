//
//  FillOutReceiptViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/02.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

class FillOutReceiptViewController: UIViewController {
    
    let inputItemSettingViewModel = InputItemSettingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inputItemSetting()
    }
    
    func inputItemSetting() {
        inputItemSettingViewModel.requestInputItemSetting() { (error) in
            if error == nil {
                let data = self.inputItemSettingViewModel.responseData
                print(data ?? "data is nil")
            } else {
                DispatchQueue.main.async {
                    self.alertMessage(title: "알림", message: error?.localizedDescription, action: nil)
                }
            }
        }
    }

}

