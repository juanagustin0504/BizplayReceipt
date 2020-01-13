//
//  ContentViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/13.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

protocol ContentDelegate: class {
    func saveContent(strContent: String)
}

// 내용 뷰에서 용도 테이블 뷰 테스팅중

class ContentViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate: ContentDelegate?

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
