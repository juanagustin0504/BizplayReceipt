//
//  EctReceiptPopup.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

protocol NewReceiptDelegate: class {
    func kindOfNewReceipt(kind: String)
}

class EctReceiptPopup: UIViewController {

    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnNewRcpt: UIButton!
    
    weak var delegate: NewReceiptDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func onCamera(_ sender: UIButton) {
        // 카메라 열기 //
        self.dismiss(animated: true) {
            self.delegate?.kindOfNewReceipt(kind: "Camera")
        }
    }
    
    @IBAction func onNewRcpt(_ sender: UIButton) {
        // 영수증 작성으로 이동
        self.dismiss(animated: true) {
            self.delegate?.kindOfNewReceipt(kind: "Receipt")
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
