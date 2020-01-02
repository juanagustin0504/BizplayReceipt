//
//  InputItemSettingViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/02.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

class InputItemSettingViewController: UIViewController {
    
    let inputItemSettingViewModel = InputItemSettingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    func inputItemSetting() {
        inputItemSettingViewModel.requestInputItemSetting() { (error) in
            if error == nil {
//                let data = self.inputItemSettingViewModel.responseData?.RESP_DATA
//                print(data ?? "data is nil")
            } else {
                DispatchQueue.main.async {
                    self.alertMessage(title: "알림", message: error?.localizedDescription, action: nil)
                }
            }
        }
    }
    
    public func gotoNewReceipt() {
        let myRcptSb = UIStoryboard(name: "MyReceiptSB", bundle: nil)
        let fillOutReceiptVc = myRcptSb.instantiateViewController(withIdentifier: "FillOutReceiptViewController_sid")
        self.navigationController?.pushViewController(fillOutReceiptVc, animated: true)
    }
    
    public func gotoCamera() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InputItemSettingViewController: NewReceiptDelegate {
    func kindOfNewReceipt(kind: String) {
        if kind == "Receipt" {
            self.gotoNewReceipt()
        } else if kind == "Camera" {
            self.gotoCamera()
        }
    }
    
    
}
