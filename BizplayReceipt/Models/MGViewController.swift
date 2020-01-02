//
//  ViewController.swift
//  ForYou
//
//  Created by vansa pha on 17/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import UIKit

class MGViewController: UIViewController {
    
    let mgViewModel = MGViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        requestMG()
    }

    private func requestMG() {
        mgViewModel.requestMG { (error) in
            if error == nil {
                self.gotoLoginScreen()
            } else {
                self.alertMessage(title: "안내", message: error?.localizedDescription, action: nil)
            }
        }
    }
    
    private func gotoLoginScreen() {
        DispatchQueue.main.async {
            let mainSb = UIStoryboard(name: "Main", bundle: nil)
            let introVc = mainSb.instantiateViewController(withIdentifier: "IntroViewController_sid")
            self.navigationController?.pushViewController(introVc, animated: true)
        }
    }

}
