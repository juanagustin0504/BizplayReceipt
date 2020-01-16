//
//  ContentViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/13.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

protocol ContentDelegate: class {
    func didSelect(content: String)
}

class ContentViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnComplete: UIBarButtonItem!
    
    weak var delegate: ContentDelegate?
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexString: "5384ED")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false

        self.navigationController?.navigationBar.tintColor = .white
    }

    @IBAction func completed() {
        dismiss(animated: true) {
            self.delegate?.didSelect(content: self.textField.text!)
        }
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
