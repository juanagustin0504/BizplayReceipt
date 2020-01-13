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
    
    @IBOutlet var datePicker: UIDatePicker!
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        formatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
        dateTime = formatter.string(from: datePicker.date)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        dateTime = formatter.string(from: sender.date)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.saveDate(dateTime: dateTime)
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
