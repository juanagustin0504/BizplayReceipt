//
//  InputItemSettingModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import Foundation

struct SCMS_METC_R004 {
    
    struct Request: Encodable { }
    
    struct Response: Decodable {
        
       let BZAQ_YN         : String // 사용처
       let AMT_YN          : String // 사용금액
       let TRSC_DTM_YN     : String // 사용일시
       let USER_YN         : String // 사용자
       let USE_USAG_YN     : String
       let RESP_CD         : String
       let RESP_MSG        : String
           
        /* * ---------- error mapping ---------- *
        
        * ----- success ----- *
        BZAQ_YN
        AMT_YN
        TRSC_DTM_YN
        USER_YN
        
        * ------ modify ----- *
        TRAN_KIND_YN => USE_USAG_YN
        
        * ------- new ------- *
        RESP_CD
        RESP_MSG
        
        --------------------------------------- */
        
    }
    
}
