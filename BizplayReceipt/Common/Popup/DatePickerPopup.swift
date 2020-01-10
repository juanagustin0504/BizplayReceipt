//
//  DatePickerPopup.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/10.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

protocol DatePickerPopupDelegate: class {
    func saveDate(dateTime: String)
}

class DatePickerPopup: UIViewController {
    
    var dateTime: String = ""
    var delegate: DatePickerPopupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePicker = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 DD일 HH:mm"
        dateTime = formatter.string(from: datePicker.date)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.delegate?.saveDate(dateTime: self.dateTime)
        self.dismiss(animated: true, completion: nil)
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
