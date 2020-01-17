//
//  ReceiptDetailSavedCell.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/17.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

class RegisteredTimeCell: UITableViewCell { // 등록된 시간 셀
    
    @IBOutlet weak var regTime: UILabel!
    
}

class BizAccountCell: UITableViewCell { // 사용처 셀
    @IBOutlet weak var bizNm: UILabel!
    
}

class CommonCell: UITableViewCell { // 공통 셀
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UILabel!
    
}

class AttachedPhotoCell: UITableViewCell { // 첨부사진 셀
    
    @IBAction func showPhotoDetail(_ sender: UIButton) {
        
    }
}

class AttachedPhotoDetailCell: UITableViewCell { // 첨부사진 자세히 보기 셀
    
    // UITableViewCell에서는 UIImageView를 Override 할 수 없음. //
    
}

class ContentDetailCell: UITableViewCell { // 상세 내용 셀
    @IBOutlet weak var textContent: UITextView!
    
}
