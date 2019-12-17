//
//  Response.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/17.
//  Copyright © 2019 WebCash. All rights reserved.
//

import Foundation

struct Response {
    
    struct LoginResponse: Decodable {
        let RSLT_CD     : String
        let RSLT_MSG    : String
        let API_SEQ_NO  : String
        let RESP_DATE   : String
        let RESP_TIME   : String
        let RESP_DATA   : LoginResponseData
    }
    
    struct LoginResponseData : Decodable {
        let USE_INTT_ID     : String
        let BIZ_NM          : String
        let BIZ_NO          : String
        let USER_ID         : String
        let USER_NM         : String
        let EML             : String
        let USER_DSNC       : String
        let STTS            : String
        let STTS_NM         : String
        let RPPR_NM         : String
        let TRCO_BADGE_YN   : String
        let SMSG_BADGE_YN   : String
    }
    
}
