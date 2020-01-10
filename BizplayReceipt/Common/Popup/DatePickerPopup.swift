//
//  DatePickerPopup.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/10.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

class DatePickerPopup: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePicker = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 DD일 HH:mm"
        let result = formatter.string(from: datePicker.date)
        print(result)
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
