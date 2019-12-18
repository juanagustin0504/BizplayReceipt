//
//  LoginModel.swift
//  ForYou
//
//  Created by vansa pha on 17/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import Foundation

//SCMS_METC_R001
struct LoginModel {
    
    struct LoginRequest: Encodable {
        let USER_ID : String
        let PWD     : String
    }
    
    struct LoginResponse : Decodable {
        let REC: [REC]
    }
    
    struct REC: Decodable {
        let USE_INTT_ID: String
        let BIZ_NM: String
        let BIZ_NO: String
    }
    
    // -------------------------With 사업장번호---------------------------------------
    struct LoginRequestWithBizNo: Encodable {
        let BIZ_NO      : String
        let USER_ID     : String
        let PWD         : String
    }
    
    struct LoginResponseWithBizNo : Decodable {
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
        let RESP_CD         : String
        let RESP_MSG        : String
    }
    
}
