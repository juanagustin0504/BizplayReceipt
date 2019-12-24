//
//  IntroViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/16.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBAction func gotoLoginVC(_ sender: UIButton) {
        
        let mainSb = UIStoryboard(name: "Main", bundle: nil)
        let loginVc = mainSb.instantiateViewController(withIdentifier: "LoginViewController_sid")
        self.navigationController?.pushViewController(loginVc, animated: true)
        
    }
    
}
