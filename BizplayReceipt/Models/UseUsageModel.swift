//
//  UseUsageModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/13.
//  Copyright © 2020 WebCash. All rights reserved.
//

import Foundation

struct SCMS_METC_R005 {
    
    struct Request: Encodable {
        let SCH_WORD: String
    }
    
    struct Response: Decodable {
        let USE_LIST: [USE_LIST]
        let REC     : [REC]
        
        struct USE_LIST: Decodable {
            let USE_USAG_CD: String
            let USE_USAG_NM: String
        }
        
        struct REC: Decodable {
            let TRAN_KIND_CD: String
            let TRAN_KIND_NM: String
        }
    
    }
    
}
