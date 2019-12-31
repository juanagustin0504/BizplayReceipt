//
//  ReceiptModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import Foundation

struct SCMS_METC_R006 {
    
    struct Request: Encodable {
        let PAGE_NO: String
        let PAGE_SZ: String
    }
    
    struct Response: Decodable {
        let PAGE_NO: String
        let PAGE_SZ: String
        let REC: [REC]
    }
    
    struct REC: Decodable {
        let REG_SEQ_NO  : String
        let STTS        : String
        let RCPT_TYPE   : String
        let FILE_URL    : String
        let FILE_REG_NO : String
        let TRSC_DT     : String
        let TRSC_TM     : String
        let TRSC_WEEK   : String
        let TX_AMT      : String
        let USE_USAG_CD : String
        let USE_USAG_NM : String
        let BZAQ_NM     : String
        let APPR_CONT   : String
        let TX_SEQ      : String
    }
    
}
