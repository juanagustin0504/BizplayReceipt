//
//  Request.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/17.
//  Copyright © 2019 WebCash. All rights reserved.
//

import Foundation

struct Request {
    
    struct LoginRequest: Encodable {
        let API_CRTS_KEY: String
        let API_SVC_ID  : String
        let USE_INTT_ID : String
        let BIZ_NO      : String
        let USER_ID     : String
        let API_SEQ_NO  : String
        let LST_TRAN_YN : String
        let REQ_DATA    : LoginRequestData
    }
    
    struct LoginRequestData: Encodable {
        let BIZ_NO  : String
        let USER_ID : String
        let PWD     : String
    }
    
}
